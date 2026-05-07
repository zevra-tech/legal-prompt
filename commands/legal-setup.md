---
description: Configure ta clé API mcp-juridique.com pour activer les MCP juridiques (à lancer une fois après l'install du plugin)
argument-hint: [api_key optionnelle]
---

Tu es chargé d'aider l'utilisateur à enregistrer sa clé API **mcp-juridique.com** dans `~/.claude/settings.json`, pour que tous les MCP du plugin `legal-prompt` puissent s'authentifier automatiquement via la variable `MCP_JURIDIQUE_API_KEY`.

## Étape 1 — Récupérer la clé

Si l'utilisateur a passé une clé en argument (`$ARGUMENTS`), utilise-la directement et passe à l'étape 2.

Sinon, dis exactement ceci au user (en français, ton chaleureux) :

> 🔑 **Configuration de ta clé API mcp-juridique.com**
>
> 1. Va sur https://mcp-juridique.com et connecte-toi
> 2. Génère une `api_key` depuis ton tableau de bord
> 3. **Colle-la dans ton prochain message** (juste la clé, rien d'autre)
>
> Elle sera enregistrée localement dans `~/.claude/settings.json` (jamais committée nulle part), et les 4 MCP juridiques (JORF, JURI, KALI, CODE) l'utiliseront automatiquement.

Puis attends que l'utilisateur réponde avec sa clé. Ne devine pas, ne fabrique pas une fausse clé.

## Étape 2 — Écrire dans `~/.claude/settings.json`

Une fois la clé reçue, fais ceci avec un soin maximal pour ne rien écraser :

1. Lis `~/.claude/settings.json` s'il existe (avec l'outil Read). S'il n'existe pas, considère le contenu comme `{}`.
2. Parse le JSON.
3. Ajoute ou met à jour la clé `env.MCP_JURIDIQUE_API_KEY` avec la valeur fournie. **Préserve toutes les autres clés** du fichier (settings, hooks, permissions, autres env vars, etc.).
4. Réécris le fichier avec l'outil Write, en JSON correctement formaté (indentation 2 espaces, nouvelle ligne finale).

Si tu n'arrives pas à parser le JSON existant (fichier corrompu), arrête-toi et demande à l'utilisateur de vérifier — ne l'écrase surtout pas.

## Étape 3 — Confirmer

Dis ceci à l'utilisateur :

> ✅ **Clé enregistrée** dans `~/.claude/settings.json` sous `env.MCP_JURIDIQUE_API_KEY`.
>
> **Dernière étape** : redémarre Claude Code (ou lance une nouvelle session) pour que les MCP juridiques se connectent.
>
> Tu pourras ensuite tester :
> - `/jurisprudence rupture conventionnelle salarié protégé`
> - ou en langage naturel : *"Cherche-moi des arrêts récents sur la rupture conventionnelle d'un salarié protégé"*

## Règles de sécurité

- **Ne jamais afficher la clé en clair** dans tes réponses après l'avoir enregistrée. Si tu dois la mentionner, tronque-la (`sk_xxxxx...4 derniers chars`).
- **Ne jamais committer** ce fichier — il est déjà dans `.gitignore` côté utilisateur, mais ne suggère jamais de le pousser.
- Si l'utilisateur te donne une chaîne qui ne ressemble pas à une clé API plausible (vide, espaces, caractères exotiques inattendus), demande confirmation avant d'écrire.
