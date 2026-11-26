# Règles de travail — Essivivi mobile

## Périmètre

Ce dépôt contient **uniquement l'application mobile Flutter** du projet ESSIVIVI-Sarl
(repo GitHub : `ESSIVIVI/Essivivi_mobile`).

Tout le travail se fait ici : `/home/uriel/Projets/Essivivi/essivivi`.

Le cahier des charges de référence se trouve dans le dossier parent :
`../cahier_charge.txt`.

## Backend : lecture seule, jamais de modification

Le backend est cloné à côté, dans `/home/uriel/Projets/Essivivi/Essivivi_backend`
(repo GitHub : `ESSIVIVI/Essivivi_backend`).

- Quelqu'un d'autre travaille déjà dessus : **risque d'écraser son travail**.
- **Interdit** : modifier un fichier, commit, push, pull/rebase, ou toute opération Git
  qui change son état dans `Essivivi_backend`.
- **Autorisé** : le consulter en lecture seule (README, modèles, routes, contrats JSON)
  uniquement pour comprendre comment brancher l'app mobile.

## Exception urgence extrême

En cas d'urgence extrême seulement :

1. Demander explicitement l'autorisation à Uriel avant toute action.
2. Attendre **deux confirmations distinctes** et explicites d'Uriel.
3. Sans ces deux confirmations : ne rien faire dans le backend, quoi qu'il arrive.
