# Fonctions MySQL

Les fonctions MySQL permettent de manipuler des chaînes de caractères, des nombres et des dates dans les requêtes SQL. Voici une introduction aux fonctions les plus couramment utilisées.

## Fonctions de chaînes de caractères

Les fonctions de chaînes permettent de transformer et manipuler du texte. Voici quelques exemples :

```sql
SELECT 
    UPPER(name) AS NameUpperPilot,          -- Convertit en majuscules
    LOWER(name) AS NameLowerPilot,          -- Convertit en minuscules
    SUBSTRING(name, 1, 4) AS NameSubPilot,  -- Extrait les 4 premiers caractères
    LENGTH(name) AS LnNamePilot,            -- Renvoie la longueur de la chaîne
    REPLACE(name, 'e', 'A') AS ReplaceNamePilot  -- Remplace 'e' par 'A'
FROM pilots;
```

Pour concaténer des chaînes, utilisez `CONCAT` ou `CONCAT_WS` :

```sql
SELECT CONCAT('Hello', ' ', 'World');            -- Concatène sans séparateur
SELECT CONCAT_WS(', ', 'Hello', 'World');        -- Concatène avec ', ' comme séparateur
```

## Conversion en Date ou DateTime

MySQL permet de convertir des valeurs en types de date :

```sql
SELECT CONVERT('2013-01-01', DATE) AS ConvertedDate;         -- Convertit en date
SELECT CONVERT(CURRENT_TIMESTAMP, DATETIME) AS ConvertedDateTime;  -- Convertit en DateTime
```

> **Remarque** : Assurez-vous que la chaîne de caractères soit bien dans un format reconnu par MySQL pour les conversions.

## Fonctions de nombres

MySQL propose de nombreuses fonctions pour manipuler les nombres, dont voici quelques-unes :

- `FLOOR(x)`: Retourne l'entier inférieur (plancher) le plus proche de `x`.
- `CEILING(x)`: Retourne l'entier supérieur (plafond) le plus proche de `x`.
- `ROUND(x, d)`: Arrondit `x` à `d` décimales.

```sql
SELECT 
    FLOOR(4.7) AS FloorValue,          -- Renvoie 4
    CEILING(4.2) AS CeilingValue,      -- Renvoie 5
    ROUND(3.14159, 2) AS RoundedValue; -- Renvoie 3.14
```

## Fonctions de dates

Les fonctions de dates permettent de manipuler et de formater les dates. 

```sql
SELECT 
    birth_date,
    CURDATE() AS CurrentDate,                          -- Date actuelle au format DATE
    YEAR(birth_date) AS BirthYear,                     -- Année de naissance
    MONTH(birth_date) AS BirthMonth,                   -- Mois de naissance
    DAY(birth_date) AS BirthDay,                       -- Jour de naissance
    CURRENT_TIMESTAMP AS CurrentDateTime,              -- Date et heure actuelles
    DATE_ADD(birth_date, INTERVAL 1 MONTH) AS NextMonth, -- Ajoute un mois
    DATEDIFF(CURRENT_TIMESTAMP, birth_date) AS DaysSinceBirth, -- Nombre de jours écoulés
    DATE_FORMAT(birth_date, '%W %M %Y') AS FormattedBirthDate  -- Formate la date en texte
FROM pilots;
```

> **Note** : Le formatage de date (`DATE_FORMAT`) utilise des codes de formatage spécifiques. `%W` donne le jour de la semaine, `%M` le mois en toutes lettres, et `%Y` l’année complète.

[exercices](./Exercices/chap5_01_function.md)