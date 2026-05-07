# 🇫🇷 Legal Prompts — Outils Claude pour avocats & juristes

Pack juridique français pour **Claude Desktop** ET **Claude Code**, branché sur les MCP officiels Légifrance / JORF / jurisprudence / conventions collectives.

- **Claude Desktop** : installeur 1 commande qui configure les 4 MCP juridiques. Tu poses tes questions en langage naturel, Claude cite ses sources.
- **Claude Code** : plugin complet avec 5 slash commands (`/veille-jo`, `/jurisprudence`...) **+** 5 skills auto-déclenchables.

---

## 🖥️ Installation Claude Desktop (1 commande)

### 1. Crée ta clé API

Inscris-toi sur **[mcp-juridique.com](https://mcp-juridique.com)** et génère une `api_key`.

### 2. Lance l'installeur

Dans ton terminal :

```bash
curl -fsSL https://raw.githubusercontent.com/zevra-tech/legal-prompt/main/install.sh | bash
```

Le script :
- te demande ta clé API (et seulement la clé)
- détecte ton OS (macOS / Linux / Windows)
- fusionne les 4 MCP dans `claude_desktop_config.json` **sans écraser** ta config existante (avec backup)

### 3. Redémarre Claude Desktop

C'est prêt. Pose tes questions en langage naturel :

> *"Trouve-moi la jurisprudence récente sur la rupture conventionnelle d'un salarié protégé"*
>
> *"Que dit l'article L. 1234-5 du Code du travail ?"*
>
> *"Brief des dernières publications du JO en droit social"*

Claude choisit les bons outils (Légifrance, jurisprudence, JO) et cite les sources.

---

## 💻 Installation Claude Code (plugin complet)

Si tu utilises **Claude Code** (CLI / IDE), tu peux installer le plugin avec ses slash commands et skills.

### 1. Crée ta clé API

Sur [mcp-juridique.com](https://mcp-juridique.com).

### 2. Installe le plugin

```
/plugin marketplace add zevra-tech/legal-prompt
/plugin install legal-prompt@legal-prompt
```

Tu récupères :
- les 4 MCP juridiques (JORF, JURI, KALI, CODE)
- 5 slash commands : `/veille-jo`, `/jurisprudence`, `/article`, `/convention`, `/note-juridique`
- 5 skills auto-déclenchables (mêmes capacités, mais en langage naturel)
- la commande de config `/legal-setup`

### 3. Configure ta clé

Dans Claude Code :

```
/legal-setup
```

La commande te demande ta clé API et l'enregistre dans `~/.claude/settings.json`. **Redémarre Claude Code** et c'est prêt.

> Pas de `export` à faire, pas de fichier de config à éditer à la main.

### Utilise

- **Slash commands** — tape `/` pour voir la liste, puis `/jurisprudence rupture conventionnelle salarié protégé`
- **Skills** — pose ta question en langage naturel, Claude déclenche le skill pertinent

---

### Install manuelle (sans installeur ni plugin)

Si tu veux gérer les fichiers toi-même :

```bash
git clone https://github.com/zevra-tech/legal-prompt.git

# Pour Claude Desktop : copie le bloc MCP dans claude_desktop_config.json
cat legal-prompt/.mcp.json

# Pour Claude Code : copie commands et skills
cp legal-prompt/commands/*.md ~/.claude/commands/
cp -r legal-prompt/skills/*  ~/.claude/skills/
# puis expose ta clé : export MCP_JURIDIQUE_API_KEY="..."
```

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
├── install.sh               (installeur Claude Desktop)
├── .claude-plugin/
│   ├── plugin.json          (manifest du plugin Claude Code)
│   └── marketplace.json     (déclare ce repo comme marketplace)
├── .mcp.json                (4 MCP juridiques préconfigurés via env var)
├── commands/                (slash commands Claude Code)
├── skills/                  (skills Claude Code auto-déclenchés)
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
