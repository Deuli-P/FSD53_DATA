# Clefs primaires et étrangères

**PRIMARY KEY** : La clef primaire est une contrainte qui identifie de manière unique chaque ligne d'une table. Elle peut être simple ou composite (composée de plusieurs colonnes) et équivaut à un **INDEX UNIQUE** et **NOT NULL**. Un **INDEX** est une structure supplémentaire créée par MySQL pour organiser les données de manière ordonnée selon les colonnes indexées.

**FOREIGN KEY** : La clef étrangère (éventuellement composite) fait référence à une clef primaire ou un INDEX dans une autre table. Pour utiliser des clefs étrangères, le moteur **InnoDB** est obligatoire, car le moteur MyISAM ne prend pas en charge les relations de ce type. Les clefs étrangères assurent **l'intégrité des données**, empêchant l'insertion de données incohérentes.

Pour créer une clef étrangère, on doit :

1. Choisir la ou les colonnes qui seront les clefs étrangères.
2. Sélectionner les colonnes de référence dans une autre table avec `REFERENCES`.

Il est important de noter que la clef étrangère est souvent définie après la clef primaire dans la table.

## Contraintes imposées entre les tables

Dans l'exemple ci-dessous, la table `pilots` est liée physiquement à la table `companies` par une clef étrangère. Les contraintes principales sont :

1. Il est impossible d'ajouter ou de modifier une ligne dans `pilots` si la compagnie référencée n'existe pas dans `companies`.
2. Il est impossible de supprimer ou de modifier une compagnie dans `companies` si celle-ci est référencée dans `pilots`.

Exemple de création de la table `pilots` avec clef étrangère :

```sql
CREATE TABLE `pilots` (
  `certificate` varchar(6) NOT NULL,
  `num_flying` decimal(7,1),
  `company` char(4),
  `name` varchar(20) NOT NULL,
  `plane` char(5),
  `bonus` decimal(5,1),
  `num_jobs` tinyint(3) unsigned,
  `next_flight` datetime,
  `birth_date` datetime,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`certificate`),
  UNIQUE KEY `un_name` (`name`),
  KEY `fk_pilots_company` (`company`),
  CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

Table `companies` :

```sql
CREATE TABLE `companies` (
  `comp` char(4) NOT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `num_street` tinyint(3) unsigned DEFAULT NULL,
  `status` enum('published','unpublished','draft') DEFAULT 'draft',
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

## Options des clefs étrangères

Les options principales pour les clefs étrangères sont **DELETE** et **UPDATE**, qui définissent le comportement de MySQL en cas de suppression ou de modification d'une référence.

- **ON DELETE** et **ON UPDATE** permettent de spécifier les comportements suivants :
  - **RESTRICT** et **NO ACTION** (comportement par défaut) : empêchent la suppression ou la modification si cela viole une contrainte d'intégrité. Ces deux options sont identiques dans MySQL.
  - **SET NULL** : remplace par `NULL` les valeurs dont la référence est supprimée.
  - **CASCADE** : supprime ou met à jour toutes les lignes dépendantes. 

### Exemple : 
Si la clef étrangère de `pilots` est définie avec `ON DELETE SET NULL`, alors la suppression d'une compagnie dans `companies` remplace la valeur de `company` par `NULL` dans `pilots`.

Si `ON DELETE CASCADE` est utilisé, supprimer une compagnie dans `companies` entraîne la suppression de tous les pilotes référencés dans `pilots`.

- **ON UPDATE** fonctionne de manière similaire :
  - **RESTRICT** et **NO ACTION** : empêchent les modifications si elles cassent une contrainte d'intégrité.
  - **SET NULL** : met `NULL` partout où la valeur modifiée était référencée.
  - **CASCADE** : modifie automatiquement les valeurs dans les tables dépendantes.

## Exemples  `ON DELETE CASCADE`

On partira des deux tables SQL suivantes : 

```sql
CREATE TABLE `authors` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `books` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(100) NOT NULL,
  `author_id` INT,
  CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors`(`id`) ON DELETE CASCADE
);
-- Insertion de données dans la table authors
INSERT INTO `authors` (`name`) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

-- Insertion de données dans la table books
INSERT INTO `books` (`title`, `author_id`) VALUES
('Harry Potter and the Philosopher\'s Stone', 1),
('Harry Potter and the Chamber of Secrets', 1),
('A Game of Thrones', 2),
('A Clash of Kings', 2),
('The Fellowship of the Ring', 3),
('The Two Towers', 3),
('The Return of the King', 3);
```
Les données authors et books, un author peut écrire de 0 à N book(s).

**select * from authors;**
+----+--------------------+
| id | name               |
+----+--------------------+
|  1 | J.K. Rowling       |
|  2 | George R.R. Martin |
|  3 | J.R.R. Tolkien     |
|  4 | J.K. Rowling       |
|  5 | George R.R. Martin |
|  6 | J.R.R. Tolkien     |
+----+--------------------+

**select * from books;**
+----+------------------------------------------+-----------+
| id | title                                    | author_id |
+----+------------------------------------------+-----------+
|  1 | Harry Potter and the Philosopher's Stone |         1 |
|  2 | Harry Potter and the Chamber of Secrets  |         1 |
|  3 | A Game of Thrones                        |         2 |
|  4 | A Clash of Kings                         |         2 |
|  5 | The Fellowship of the Ring               |         3 |
|  6 | The Two Towers                           |         3 |
|  7 | The Return of the King                   |         3 |
+----+------------------------------------------+-----------+

1. Supprimons maintenant un `author` et voyons ce que cela donne dans la table `books`:

```sql
DELETE FROM `authors` WHERE `id`= 1 ;
```
**select * from authors;**
+----+--------------------+
| id | name               |
+----+--------------------+
|  2 | George R.R. Martin |
|  3 | J.R.R. Tolkien     |
+----+--------------------+

- On peut supprimer un author et ses livres dans la table `books` seront également supprimés, TRES DANGEREUX, car dans ce cas vous perdez de l'information.

**select * from books;**
+----+----------------------------+-----------+
| id | title                      | author_id |
+----+----------------------------+-----------+
|  3 | A Game of Thrones          |         2 |
|  4 | A Clash of Kings           |         2 |
|  5 | The Fellowship of the Ring |         3 |
|  6 | The Two Towers             |         3 |
|  7 | The Return of the King     |         3 |
+----+----------------------------+-----------+

## Exemple avec `ON DELETE SET NULL`

Attention le champ `author_id` peut-être NULL, c'est souvent le cas, car vous pouvez entrer des livres en base de données sans connaître encore l'auteur.

```sql
DROP TABLE IF EXISTS `books`;
DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `books` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(100) NOT NULL,
  `author_id` INT, -- ce champ doit être NULL possiblement
  CONSTRAINT `fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors`(`id`) ON DELETE SET NULL
);

-- Pensez à ré-insérer les données d'exemple
```
On supprime un author voyons ce qui se passe au niveau des données.

```sql
DELETE FROM `authors` WHERE id=1;
```
**select * from authors;**
+----+--------------------+
| id | name               |
+----+--------------------+
|  2 | George R.R. Martin |
|  3 | J.R.R. Tolkien     |
+----+--------------------+

- Dans ce cas les livres ne sont pas supprimés.

**select * from books;**
+----+------------------------------------------+-----------+
| id | title                                    | author_id |
+----+------------------------------------------+-----------+
|  1 | Harry Potter and the Philosopher's Stone |      NULL |
|  2 | Harry Potter and the Chamber of Secrets  |      NULL |
|  3 | A Game of Thrones                        |         2 |
|  4 | A Clash of Kings                         |         2 |
|  5 | The Fellowship of the Ring               |         3 |
|  6 | The Two Towers                           |         3 |
|  7 | The Return of the King                   |         3 |
+----+------------------------------------------+-----------+
