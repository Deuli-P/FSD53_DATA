### SQL : Structured Query Language

#### Introduction
SQL, ou Structured Query Language, est le langage standardisé pour l'interaction avec des bases de données relationnelles. Créé dans les années 1970 par IBM, il a été conçu pour permettre le stockage, la manipulation, et la récupération efficace de données structurées sous forme de tables. Il est devenu un standard industriel en 1987, supporté par de nombreux systèmes de gestion de bases de données (SGBD) tels que MySQL, PostgreSQL, et Oracle.

Une base de données relationnelle organise les données en **tables**, où chaque table est composée de **lignes** (ou enregistrements) et de **colonnes** (ou champs). Cette structure permet de définir des relations entre différentes tables et d’exploiter ces relations pour effectuer des analyses de données plus complexes et interconnectées.

Un **SGBD** (Système de Gestion de Base de Données) est un logiciel qui implémente SQL et offre des outils pour gérer les bases de données, automatiser certaines tâches, et garantir la sécurité et la cohérence des données. MySQL, par exemple, est l'un des SGBD les plus populaires grâce à sa performance et sa polyvalence. 

> **Remarque** : En parallèle des bases de données relationnelles, il existe des systèmes NoSQL, qui sont conçus pour des données non structurées ou semi-structurées et sont optimisés pour des types d'usage différents.

#### Groupes de Commandes SQL
SQL comprend plusieurs sous-ensembles de commandes, chacun correspondant à une fonction précise :

- **DDL (Data Definition Language)** : Commandes pour définir et modifier la structure des bases de données, telles que :
  - `CREATE` : Création de nouvelles tables, bases de données ou autres objets.
  - `ALTER` : Modification de la structure d'une table existante.
  - `DROP` : Suppression d'une table ou d'une base de données.
  - `RENAME` : Changement de nom d'une table ou d'une colonne.

- **DQL (Data Query Language)** : 
  - `SELECT` : Commande clé pour extraire les données. Le `SELECT` permet de récupérer des données spécifiques dans des tables avec des filtres, des tris et des fonctions d'agrégation.

- **DML (Data Manipulation Language)** : Commandes pour manipuler les données stockées dans les tables, notamment :
  - `INSERT` : Insertion de nouvelles lignes.
  - `DELETE` : Suppression de lignes existantes.
  - `UPDATE` : Mise à jour de données spécifiques dans des lignes.

- **DCL (Data Control Language)** : Commandes pour contrôler l'accès et la sécurité des données, comme :
  - `GRANT` et `REVOKE` : Administration des droits d'accès des utilisateurs aux tables et aux bases.
  - `COMMIT` et `ROLLBACK` : Gestion des transactions pour assurer la cohérence des données en autorisant ou en annulant des modifications.

#### MySQL : SGBD Relationnel
MySQL est un système de gestion de base de données populaire pour les applications web, souvent privilégié pour ses performances élevées et sa facilité de déploiement. Initialement open-source, MySQL est désormais détenu par Oracle Corporation, et reste disponible en tant que logiciel open-source sous licence GPL.

Avantages de MySQL :
- **Multiplateforme** : Disponible pour divers systèmes d'exploitation.
- **Performance élevée** : Particulièrement performant pour des opérations de lecture intensives (extraction des données).

Limitations de MySQL :
- **Volume de données** : Historiquement moins adapté aux très gros volumes de données ou aux analyses complexes que d'autres SGBD, bien qu'il ait beaucoup évolué pour mieux répondre à ces besoins.

Dans MySQL, chaque serveur peut contenir plusieurs bases de données, et chaque base de données peut contenir plusieurs tables. Ces tables organisent les données sous forme de lignes et colonnes.

#### Encodage des Caractères et Collations
Le choix d’un jeu de caractères et d’une collation est important lors de la création de tables pour garantir la bonne prise en charge des caractères et la cohérence des opérations de comparaison et de tri. MySQL permet de choisir le jeu de caractères UTF-8 (ou UTF8mb4 pour une version plus étendue), idéal pour le support de textes internationaux.

- **Jeu de caractères** : Représente les caractères en utilisant des encodages standards. L’UTF-8, par exemple, est un standard international permettant de représenter presque tous les caractères du monde.
- **Collation** : Définit les règles de tri et de comparaison des caractères. Par exemple, `utf8_general_ci` est une collation insensible à la casse (ci pour "case-insensitive"), ce qui rend les comparaisons de chaînes de caractères plus rapides pour certains usages.

#### Structure des Données dans une Base de Données Relationnelle
Dans MySQL, une base de données est constituée de tables, et chaque table est constituée de colonnes définies avec des types de données spécifiques :
- **Types de données numériques** : `INT`, `FLOAT`, etc.
- **Types de texte** : `VARCHAR`, `TEXT`, etc.
- **Types de date et heure** : `DATE`, `TIME`, `DATETIME`, etc.
- **Types booléens** : Représentation des valeurs `TRUE` et `FALSE`.

Chaque table stocke des données sous forme de lignes, et chaque ligne correspond à un enregistrement unique. Le choix des types de données est crucial pour optimiser le stockage, garantir la précision et faciliter la recherche des données.

> **Exemple** : La colonne `id` est souvent de type `INT` pour des identifiants uniques, tandis que des noms ou descriptions sont stockés sous le type `VARCHAR` pour des chaînes de caractères de longueur variable.

Excellente idée ! Ajouter une section sur les collations et l’encodage dès l’introduction permet de sensibiliser les étudiants aux enjeux de compatibilité des caractères et des performances dès le début du cours. Voici une suggestion de contenu, avec quelques commandes MySQL pour illustrer l’encodage et les collations.


### Collations et Encodage dans MySQL

L’encodage et les collations sont deux aspects essentiels pour la gestion de données texte dans une base de données. Ils influencent la manière dont les caractères sont stockés, triés et comparés, ce qui est crucial pour des applications multilingues ou nécessitant des tris précis.

#### 1. **Encodage des caractères**

L’encodage détermine la manière dont les caractères sont stockés. MySQL utilise principalement l’UTF-8, un encodage compatible avec Unicode qui permet de représenter un vaste ensemble de caractères. L’UTF8 traditionnel de MySQL (appelé `utf8`) stocke chaque caractère sur un maximum de 3 octets. Toutefois, pour des caractères étendus, `utf8mb4` est recommandé car il utilise jusqu'à 4 octets, permettant ainsi d’intégrer des emojis, symboles et des alphabets supplémentaires.

```sql
-- Définir l’encodage de la base de données
CREATE DATABASE my_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Vérifier l’encodage et la collation d’une table
SHOW TABLE STATUS WHERE Name = 'ma_table';
```

#### 2. **Collations**

La collation détermine les règles de tri et de comparaison des caractères. Par exemple, une collation insensible à la casse (`ci` pour *case insensitive*) traite les lettres majuscules et minuscules comme équivalentes, alors qu'une collation sensible à la casse ne les considérera pas égales.

- **utf8_general_ci** : Ignorant la casse, elle est rapide pour les recherches de texte.
- **utf8mb4_unicode_ci** : Insensible à la casse, elle est plus précise pour les comparaisons multilingues.
  
Voici quelques commandes pour travailler avec les collations :

```sql
-- Créer une table avec une collation spécifique
CREATE TABLE utilisateurs (
    nom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
);

-- Modifier la collation d'une colonne existante
ALTER TABLE utilisateurs MODIFY nom VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Vérifier les collations disponibles
SHOW COLLATION LIKE 'utf8%';
```

#### 3. **Exemples pratiques d’encodage et de collation**

```sql
-- Comparaison insensible à la casse
SELECT 'école' = 'ECOLE' COLLATE utf8mb4_unicode_ci; -- Renvoie 1 (vrai)

-- Comparaison sensible à la casse
SELECT 'école' = 'ECOLE' COLLATE utf8mb4_bin; -- Renvoie 0 (faux)

-- Connaître l’encodage utilisé pour une chaîne
SELECT HEX('école') AS Encodage_UTF8;
```
