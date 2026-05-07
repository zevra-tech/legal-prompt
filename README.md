# 🇫🇷 Legal Prompts — Outils Claude pour avocats & juristes

Pack juridique français pour **Claude Code**, livré sous forme de **plugin** : 5 slash commands (`/veille-jo`, `/jurisprudence`, `/article`, `/convention`, `/note-juridique`) **+** 5 skills auto-déclenchables, branchés sur les MCP officiels Légifrance / JORF / jurisprudence / conventions collectives.

Tu choisis ton ergonomie : invocation explicite (`/jurisprudence salarié protégé...`) ou déclenchement automatique par Claude quand tu poses une question juridique en langage naturel.

## ⚡ Installation

### 1. Crée ton compte et récupère ta clé API

Avant toute chose, il te faut une clé API pour authentifier les requêtes vers les MCP juridiques :

1. Crée un compte sur **[mcp-juridique.com](https://mcp-juridique.com)**
2. Génère une `api_key` depuis ton tableau de bord
3. Garde-la sous la main pour l'étape suivante

### 2. Connecte les MCP

Ouvre `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) ou `%APPDATA%\Claude\claude_desktop_config.json` (Windows) et ajoute (en remplaçant `YOUR_API_KEY` par ta clé) :

```json
{
  "mcpServers": {
    "jorf": {
      "url": "https://jorf-mcp.super-novia.io/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    },
    "juri": {
      "url": "https://juri-mcp.super-novia.io/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    },
    "kali": {
      "url": "https://kali-mcp.super-novia.io/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    },
    "code": {
      "url": "https://code-mcp.super-novia.io/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    }
  }
}
```

Redémarre Claude Desktop.

### 3. Installe le plugin (recommandé — Claude Code)

Dans Claude Code :

```
/plugin marketplace add zevra-tech/legal-prompt
/plugin install legal-prompt@legal-prompt
```

Tu récupères d'un coup les 5 slash commands **et** les 5 skills.

#### Alternative : install manuelle des fichiers

Si tu veux juste copier les fichiers :

```bash
git clone https://github.com/zevra-tech/legal-prompt.git
# Slash commands
cp legal-prompt/commands/*.md ~/.claude/commands/
# Skills (chaque skill est un dossier avec SKILL.md)
cp -r legal-prompt/skills/* ~/.claude/skills/
```

### 4. Utilise

- **Slash commands** — tape `/` dans Claude pour voir la liste, puis `/jurisprudence rupture conventionnelle salarié protégé`
- **Skills** — pose ta question en langage naturel, Claude déclenche le skill pertinent : *"Cherche-moi de la jurisprudence récente sur la rupture conventionnelle d'un salarié protégé"*

## 📚 Les 5 prompts

| Nom | Usage | MCP utilisés |
|---|---|---|
| [`veille-jo`](commands/veille-jo.md) · [skill](skills/veille-jo/SKILL.md) | Brief des publications JO du jour, filtré par domaine | JORF |
| [`jurisprudence`](commands/jurisprudence.md) · [skill](skills/jurisprudence/SKILL.md) | Recherche + analyse de jurisprudence | JURI |
| [`article`](commands/article.md) · [skill](skills/article/SKILL.md) | Décryptage d'un article de code (toutes versions) | CODE |
| [`convention`](commands/convention.md) · [skill](skills/convention/SKILL.md) | Question sur une convention collective via IDCC | KALI |
| [`note-juridique`](commands/note-juridique.md) · [skill](skills/note-juridique/SKILL.md) | Note de synthèse multi-sources sur une question | Tous |

## 🧩 Structure du repo

```
.
├── .claude-plugin/
│   ├── plugin.json          (manifest du plugin)
│   └── marketplace.json     (déclare ce repo comme marketplace)
├── commands/                (slash commands invoquées explicitement)
├── skills/                  (skills auto-déclenchés par Claude)
│   ├── veille-jo/SKILL.md
│   └── ...
└── templates/_template.md   (modèle pour contribuer)
```

## 🎯 Pour qui ?

Avocats, juristes d'entreprise, étudiants en droit, paralegals — tous ceux qui veulent gagner du temps sur les recherches juridiques avec une IA qui cite ses sources officielles.

## 🤝 Contribution

PRs bienvenues. Format d'un prompt : voir [`templates/_template.md`](templates/_template.md).

## 📜 Licence

MIT — utilise, fork, modifie librement.

## 🔗 Liens

- API & MCP juridiques : [mcp-juridique.com](https://mcp-juridique.com)
- Plume (édition de documents juridiques) : [plume.zevra.tech](https://plume.zevra.tech)

---

⭐ **Si ça t'aide, mets une étoile au repo — ça aide d'autres juristes à le trouver.**
