---
name: nom-de-la-commande
description: Description courte (apparaît dans l'autocomplete Claude)
arguments:
  - name: argument1
    description: Description de l'argument
    required: true
  - name: argument2
    description: Argument optionnel
    required: false
---

[Rôle assigné à Claude — 1 phrase]

**Contexte / inputs** :
- Argument 1 : {{argument1}}
- Argument 2 : {{argument2 | default: "valeur par défaut"}}

**Méthode** :

1. [Étape 1, en précisant les outils MCP à appeler]
2. [Étape 2]
3. [Étape 3]

**Format de sortie** :

```
[Structure markdown attendue]
```

**Règles** :
- [Règles de qualité, format, vérification]
- [Limites à respecter — citations, sources, etc.]

[Instruction finale pour démarrer immédiatement]
