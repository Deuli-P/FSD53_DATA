# Jointures en SQL

## Introduction

Les jointures permettent d'extraire des données réparties dans plusieurs tables. Dans le modèle relationnel SQL, les données sont souvent décomposées en différentes tables (entités) pour mieux organiser et structurer l'information. Les jointures sont donc essentielles pour récupérer des données de tables distinctes.

## Principe

Une jointure relie deux tables en utilisant une clause de jointure, généralement basée sur une condition de comparaison entre colonnes. Souvent, cette condition implique une clé étrangère d'une table et une clé primaire de l'autre table. Ces colonnes, qui sont souvent indexées, permettent d'optimiser les performances de la requête.

## La jointure interne (INNER JOIN)

Une **jointure interne** (ou *inner join*) ne retourne que les enregistrements ayant des correspondances dans les deux tables impliquées. Par conséquent, seules les données communes entre les tables sont extraites, et les enregistrements sans correspondance sont ignorés.

**Exemple** : Extraire les livres et leurs auteurs uniquement pour les auteurs ayant au moins un livre enregistré.

```sql
SELECT authors.name, books.title
FROM authors
INNER JOIN books
ON authors.id = books.author_id;
```

Dans cet exemple, seuls les auteurs ayant au moins un livre enregistré apparaîtront dans le résultat.

### Auto-jointure

Une auto-jointure est une jointure interne appliquée sur la même table. Elle est utile pour comparer les enregistrements d'une table entre eux. On utilise des alias pour distinguer les deux instances de la même table.

**Exemple** : Comparer les auteurs pour identifier des auteurs ayant le même prénom.

```sql
SELECT a1.name AS author_name1, a2.name AS author_name2
FROM authors AS a1
INNER JOIN authors AS a2
ON a1.first_name = a2.first_name AND a1.id <> a2.id;
```

## La jointure externe (LEFT OUTER JOIN et RIGHT OUTER JOIN)

Une **jointure externe** permet d'inclure les enregistrements d'une table dominante, même si aucune correspondance n'est trouvée dans l'autre table. On distingue :

- **LEFT OUTER JOIN** : Toutes les lignes de la table de gauche (dominante) sont incluses, même celles sans correspondance dans la table de droite.
- **RIGHT OUTER JOIN** : Toutes les lignes de la table de droite sont incluses, même celles sans correspondance dans la table de gauche.

**Exemple** : Extraire tous les auteurs et, s’ils en ont, leurs livres. Les auteurs sans livre auront `NULL` comme titre de livre.

```sql
SELECT authors.name, books.title
FROM authors
LEFT OUTER JOIN books
ON authors.id = books.author_id;
```

Dans cet exemple, tous les auteurs apparaissent, même ceux sans livres (qui auront un `NULL` dans la colonne `title`).

> **Note** : MySQL ne supporte pas le `FULL OUTER JOIN`, qui inclurait toutes les lignes des deux tables, qu'il y ait correspondance ou non.

## Exclure les correspondances

On peut utiliser une jointure externe avec une condition pour extraire les enregistrements d'une table tout en excluant ceux qui ont des correspondances dans l'autre table.

**Exemple** : Extraire tous les auteurs sans livre.

```sql
SELECT authors.name
FROM authors
LEFT OUTER JOIN books
ON authors.id = books.author_id
WHERE books.author_id IS NULL;
```

Dans cet exemple, on utilise `WHERE books.author_id IS NULL` pour exclure les auteurs ayant des correspondances dans `books`.
