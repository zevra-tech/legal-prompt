# 🇫🇷 Legal Prompts — Outils Claude pour avocats & juristes

[![skills.sh](https://skills.sh/b/zevra-tech/legal-prompt)](https://skills.sh/zevra-tech/legal-prompt)

Pack juridique français pour **Claude Desktop**, **Claude Code** et tout agent compatible (Cursor, Cline, Codex, Copilot...), branché sur les MCP officiels Légifrance / JORF / jurisprudence / conventions collectives.

- **Claude Desktop** : installeur 1 commande qui configure les 4 MCP juridiques. Tu poses tes questions en langage naturel, Claude cite ses sources.
- **Claude Code** : plugin complet avec 5 slash commands (`/veille-jo`, `/jurisprudence`...) **+** 5 skills auto-déclenchables.
- **Autres agents (Cursor, Cline, Codex, Copilot...)** : skills installables via `npx skills add`.

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

## 🌐 Installation pour autres agents (Cursor, Cline, Codex, Copilot...)

Les 5 skills s'installent via [skills.sh](https://skills.sh/zevra-tech/legal-prompt) sur n'importe quel agent compatible :

```bash
# Tous les skills, globalement
npx skills add zevra-tech/legal-prompt -g

# Ou en sélectionnant un agent et un skill précis
npx skills add zevra-tech/legal-prompt -a cursor --skill jurisprudence

# Lister sans installer
npx skills add zevra-tech/legal-prompt --list
```

Pour la connexion aux 4 MCP juridiques, configure-les manuellement dans ton agent (URL + header `Authorization: Bearer <ta_clé>` cf. [`.mcp.json`](.mcp.json)). Les slash commands `/jurisprudence`, etc., sont **spécifiques à Claude Code** — sur les autres agents, tu utilises uniquement les skills (auto-déclenchement par langage naturel).

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

## 💼 Cas d'usage concrets

### 1. Veille du matin pour avocat en droit social
8h45, café, tu veux savoir si le JO d'hier a sorti quelque chose qui touche tes dossiers en cours.
> `/veille-jo droit social hier`
> ou : *"Brief des publications JO d'hier en droit social, focus impact pratique"*

→ 2-3 textes pertinents max, NOR, portée concrète, action recommandée.

### 2. Préparer une plaidoirie devant les Prud'hommes
Audience dans 3 jours sur un licenciement pour faute grave d'un cadre. Tu veux la position de la Cour de cassation et anticiper les arguments adverses.
> `/jurisprudence faute grave cadre absences répétées non justifiées cassation`
> ou : *"Cherche-moi des arrêts récents de la Cour de cassation sur la qualification de faute grave en cas d'absences répétées d'un cadre"*

→ 3-5 arrêts clés, citation utile (≤15 mots), apport, points de vigilance.

### 3. Décrypter un article pour un client non-juriste
Ton client gérant de PME ne comprend pas pourquoi son comptable lui parle de l'article 1240 du Code civil.
> `/article 1240 Code civil`

→ Texte officiel + place dans le code + explication en français clair.

### 4. Question pointue sur une convention collective
DRH te demande le préavis d'un cadre Syntec qui démissionne après 4 ans d'ancienneté.
> `/convention 1486 préavis cadre démission 4 ans ancienneté`

→ Chiffre exact, article de la convention cité, articulation avec le Code du travail.

### 5. Note de consultation pour un confrère
Un confrère te demande une analyse sur la rupture conventionnelle d'un salarié protégé.
> `/note-juridique rupture conventionnelle salarié protégé complete`
> ou : *"Rédige-moi une note juridique structurée sur la rupture conventionnelle d'un salarié protégé"*

→ Note en 6 sections (question / synthèse / cadre / analyse / reco / vigilance) avec sources Légifrance.

### 6. Tracer l'historique d'un article (litige sur faits anciens)
Dossier sur des faits de 2018 : tu veux la version de l'article applicable à l'époque, pas l'actuelle.
> `/article L. 1234-5 Code du travail historique`

→ Versions successives, dates, lois de modification, synthèse de l'évolution.

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
