# 🇫🇷 Legal Prompts — Outils Claude pour avocats & juristes

Pack juridique français pour **Claude Code**, livré sous forme de **plugin** : 5 slash commands (`/veille-jo`, `/jurisprudence`, `/article`, `/convention`, `/note-juridique`) **+** 5 skills auto-déclenchables, branchés sur les MCP officiels Légifrance / JORF / jurisprudence / conventions collectives.

Tu choisis ton ergonomie : invocation explicite (`/jurisprudence salarié protégé...`) ou déclenchement automatique par Claude quand tu poses une question juridique en langage naturel.

## ⚡ Installation (3 étapes, ~1 min)

### 1. Crée ton compte sur mcp-juridique.com

[mcp-juridique.com](https://mcp-juridique.com) → inscription → génère une `api_key` depuis ton tableau de bord. Garde-la sous la main pour l'étape 3.

### 2. Installe le plugin

Dans Claude Code :

```
/plugin marketplace add zevra-tech/legal-prompt
/plugin install legal-prompt@legal-prompt
```

Tu récupères d'un coup :
- les 4 MCP juridiques (JORF, JURI, KALI, CODE)
- les 5 slash commands
- les 5 skills auto-déclenchables
- la commande de configuration `/legal-setup`

### 3. Configure ta clé avec `/legal-setup`

Dans Claude Code, tape :

```
/legal-setup
```

La commande te demande de coller ta clé API, puis l'enregistre dans `~/.claude/settings.json` (jamais committée). **Redémarre Claude Code** ensuite pour que les MCP se connectent — c'est prêt.

> Pas de `export` à faire, pas de fichier de config à éditer à la main.

#### Alternative : install manuelle (sans plugin)

Si tu ne veux pas passer par le plugin :

```bash
git clone https://github.com/zevra-tech/legal-prompt.git
# MCP servers (à fusionner dans ton claude_desktop_config.json)
cat legal-prompt/.mcp.json
# Slash commands
cp legal-prompt/commands/*.md ~/.claude/commands/
# Skills (chaque skill est un dossier avec SKILL.md)
cp -r legal-prompt/skills/* ~/.claude/skills/
# Et expose ta clé : export MCP_JURIDIQUE_API_KEY="..."
```

### Utilise

- **Slash commands** — tape `/` dans Claude pour voir la liste, puis `/jurisprudence rupture conventionnelle salarié protégé`
- **Skills** — pose ta question en langage naturel, Claude déclenche le skill pertinent : *"Cherche-moi de la jurisprudence récente sur la rupture conventionnelle d'un salarié protégé"*

## 📚 Les 5 prompts juridiques

| Nom | Usage | MCP utilisés |
|---|---|---|
| [`veille-jo`](commands/veille-jo.md) · [skill](skills/veille-jo/SKILL.md) | Brief des publications JO du jour, filtré par domaine | JORF |
| [`jurisprudence`](commands/jurisprudence.md) · [skill](skills/jurisprudence/SKILL.md) | Recherche + analyse de jurisprudence | JURI |
| [`article`](commands/article.md) · [skill](skills/article/SKILL.md) | Décryptage d'un article de code (toutes versions) | CODE |
| [`convention`](commands/convention.md) · [skill](skills/convention/SKILL.md) | Question sur une convention collective via IDCC | KALI |
| [`note-juridique`](commands/note-juridique.md) · [skill](skills/note-juridique/SKILL.md) | Note de synthèse multi-sources sur une question | Tous |

Plus une commande de configuration : [`/legal-setup`](commands/legal-setup.md) — enregistre ta clé API une fois pour toutes.

## 🧩 Structure du repo

```
.
├── .claude-plugin/
│   ├── plugin.json          (manifest du plugin)
│   └── marketplace.json     (déclare ce repo comme marketplace)
├── .mcp.json                (4 MCP juridiques préconfigurés via env var)
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
