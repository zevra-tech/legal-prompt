# 🇫🇷 Legal Prompts — Outils Claude pour avocats & juristes

Pack de prompts prêts à l'emploi pour **Claude Desktop** ou **Claude Code**, branchés sur les MCP juridiques français de [super-novia.io](https://super-novia.io).

Chaque prompt est une commande slash (`/veille-jo`, `/jurisprudence`...) qui transforme Claude en assistant juridique spécialisé, avec accès direct aux sources officielles : Légifrance, JORF, jurisprudence judiciaire, conventions collectives.

## ⚡ Installation (2 min)

### 1. Connecte les MCP dans Claude Desktop

Ouvre `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) ou `%APPDATA%\Claude\claude_desktop_config.json` (Windows) et ajoute :

```json
{
  "mcpServers": {
    "jorf": { "url": "https://jorf-mcp.super-novia.io/mcp" },
    "juri": { "url": "https://juri-mcp.super-novia.io/mcp" },
    "kali": { "url": "https://kali-mcp.super-novia.io/mcp" },
    "code": { "url": "https://code-mcp.super-novia.io/mcp" }
  }
}
```

Redémarre Claude Desktop.

### 2. Installe les prompts

Copie les fichiers `.md` du dossier `prompts/` dans :

- **macOS** : `~/Library/Application Support/Claude/prompts/`
- **Windows** : `%APPDATA%\Claude\prompts\`

Ou clone le repo directement :

```bash
git clone https://github.com/super-novia/legal-prompts.git
cp legal-prompts/prompts/*.md ~/Library/Application\ Support/Claude/prompts/
```

### 3. Utilise

Dans Claude, tape `/` pour voir les commandes disponibles.

## 📚 Les 5 prompts

| Commande | Usage | MCP utilisés |
|---|---|---|
| [`/veille-jo`](prompts/veille-jo.md) | Brief des publications JO du jour, filtré par domaine | JORF |
| [`/jurisprudence`](prompts/jurisprudence.md) | Recherche + analyse de jurisprudence | JURI |
| [`/article`](prompts/article.md) | Décryptage d'un article de code (toutes versions) | CODE |
| [`/convention`](prompts/convention.md) | Question sur une convention collective via IDCC | KALI |
| [`/note-juridique`](prompts/note-juridique.md) | Note de synthèse multi-sources sur une question | Tous |

## 🎯 Pour qui ?

Avocats, juristes d'entreprise, étudiants en droit, paralegals — tous ceux qui veulent gagner du temps sur les recherches juridiques avec une IA qui cite ses sources officielles.

## 🤝 Contribution

PRs bienvenues. Format d'un prompt : voir [`prompts/_template.md`](prompts/_template.md).

## 📜 Licence

MIT — utilise, fork, modifie librement.

## 🔗 Liens

- MCP servers : [super-novia.io](https://super-novia.io)
- Plume (édition de documents juridiques) : [plume.zevra.tech](https://plume.zevra.tech)
- Twitter/LinkedIn : [@joachim_xxx](#)

---

⭐ **Si ça t'aide, mets une étoile au repo — ça aide d'autres juristes à le trouver.**
