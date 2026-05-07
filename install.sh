#!/usr/bin/env bash
#
# Legal Prompt — installeur Claude Desktop
#
# Configure les 4 MCP juridiques (JORF, JURI, KALI, CODE) dans
# claude_desktop_config.json et y injecte ta clé API mcp-juridique.com.
#
# Usage :
#   curl -fsSL https://raw.githubusercontent.com/zevra-tech/legal-prompt/main/install.sh | bash
#

set -euo pipefail

red()    { printf "\033[31m%s\033[0m\n" "$1"; }
green()  { printf "\033[32m%s\033[0m\n" "$1"; }
yellow() { printf "\033[33m%s\033[0m\n" "$1"; }
blue()   { printf "\033[34m%s\033[0m\n" "$1"; }
bold()   { printf "\033[1m%s\033[0m\n" "$1"; }

bold "🇫🇷  Legal Prompt — installeur Claude Desktop"
echo

# 1. Détecter l'OS et le chemin de config Claude Desktop
case "$OSTYPE" in
  darwin*)              CONFIG_DIR="$HOME/Library/Application Support/Claude" ;;
  linux*)               CONFIG_DIR="$HOME/.config/Claude" ;;
  msys*|cygwin*|mingw*) CONFIG_DIR="${APPDATA:-$HOME/AppData/Roaming}/Claude" ;;
  *) red "OS non détecté ($OSTYPE) — installation manuelle requise."; exit 1 ;;
esac

CONFIG_FILE="$CONFIG_DIR/claude_desktop_config.json"

if [ ! -d "$CONFIG_DIR" ]; then
  red "Dossier de config Claude Desktop introuvable :"
  red "  $CONFIG_DIR"
  echo
  yellow "Installe et lance Claude Desktop au moins une fois, puis relance cet installeur."
  exit 1
fi

# 2. Vérifier python3 (pour fusionner le JSON sans rien écraser)
if ! command -v python3 >/dev/null 2>&1; then
  red "python3 est requis pour fusionner la config en sécurité."
  exit 1
fi

# 3. Demander la clé API (en lisant le terminal, même si le script est piped)
echo "Pour activer les MCP juridiques, j'ai besoin de ta clé API mcp-juridique.com."
echo "Pas encore de compte ? → https://mcp-juridique.com (gratuit, 1 min)"
echo
printf "🔑  Colle ta clé API ici : "
if [ -t 0 ]; then
  read -r API_KEY
else
  read -r API_KEY < /dev/tty
fi

if [ -z "${API_KEY:-}" ]; then
  red "Clé vide — abandon."
  exit 1
fi

# 4. Backup de la config existante
if [ -f "$CONFIG_FILE" ]; then
  BACKUP="$CONFIG_FILE.backup.$(date +%s)"
  cp "$CONFIG_FILE" "$BACKUP"
  green "💾  Backup : $BACKUP"
fi

# 5. Fusionner les 4 MCP dans claude_desktop_config.json (préserve l'existant)
python3 - "$API_KEY" "$CONFIG_FILE" <<'PYEOF'
import json, os, sys

api_key, path = sys.argv[1], sys.argv[2]

try:
    with open(path) as f:
        cfg = json.load(f)
    if not isinstance(cfg, dict):
        cfg = {}
except (FileNotFoundError, json.JSONDecodeError):
    cfg = {}

cfg.setdefault("mcpServers", {})

servers = {
    "jorf": "https://jorf-mcp.super-novia.io/mcp",
    "juri": "https://juri-mcp.super-novia.io/mcp",
    "kali": "https://kali-mcp.super-novia.io/mcp",
    "code": "https://code-mcp.super-novia.io/mcp",
}

for name, url in servers.items():
    cfg["mcpServers"][name] = {
        "url": url,
        "headers": {"Authorization": f"Bearer {api_key}"},
    }

os.makedirs(os.path.dirname(path), exist_ok=True)
with open(path, "w") as f:
    json.dump(cfg, f, indent=2, ensure_ascii=False)
    f.write("\n")
PYEOF

# 6. Confirmer
green "✅  4 MCP juridiques (JORF, JURI, KALI, CODE) configurés."
echo "    → $CONFIG_FILE"
echo
bold "Dernière étape : redémarre Claude Desktop."
echo
blue "Tu pourras ensuite poser des questions en langage naturel —"
blue "Claude interrogera Légifrance, le JO, la jurisprudence et les"
blue "conventions collectives automatiquement, avec citations."
