# Insertion des données

Nous allons aborder dans ce chapitre l'aspect LMD (langage de manipulation des données) de MySQL.

On a trois instructions :

- `INSERT` pour l'insertion d'enregistrement.
- `UPDATE` pour la modification de données.
- `DELETE` et `TRUNCATE` pour la suppression des données.

## INSERT Syntaxe

### Insertion de base

La syntaxe suivante permet l'insertion de données. Son inconvénient est qu'il faut renseigner toutes les colonnes pour qu'elle s'exécute correctement dans MySQL :

```sql
INSERT INTO avions
VALUES (valeur_1, valeur_2, ...);
```

Une autre syntaxe plus souple est la suivante : vous ne renseignez que les colonnes voulues. Attention cependant aux colonnes dont les valeurs sont obligatoires.

```sql
INSERT INTO avions (nom_colonne_1, nom_colonne_2)
VALUES ('valeur 1', 'valeur 2');
```

Dans ce cas, seules les colonnes mentionnées seront enregistrées. Attention cependant aux colonnes dont les données sont obligatoires (NOT NULL).

Vous pouvez également enregistrer plusieurs lignes à la fois :

```sql
INSERT INTO avions (nom_colonne_1, nom_colonne_2)
VALUES
('valeur 1', 'valeur 2'),
('valeur 11', 'valeur 22'),
('valeur 111', 'valeur 222');
```

## Application d'insertion de données dans la table `companies`

Insérez les données suivantes dans la table `companies` :

```text
+------+-----------+-----------+--------------+------------+--------+
| comp | street    | city      | name         | num_street | status |
+------+-----------+-----------+--------------+------------+--------+
| AUS  | sydney    | Australie | AUSTRA Air   |         19 | draft  |
| CHI  | chi       | Chine     | CHINA Air    |       NULL | draft  |
| FRE1 | beaubourg | France    | Air France   |         17 | draft  |
| FRE2 | paris     | France    | Air Electric |         22 | draft  |
| SIN  | pasir     | Singapour | SIN A        |         15 | draft  |
+------+-----------+-----------+--------------+------------+--------+
```

Utilisez le code suivant pour insérer les données dans la table `companies` :

```sql
INSERT INTO companies (comp, street, city, name, num_street, status)
VALUES
('AUS', 'sydney', 'Australie', 'AUSTRA Air', 19, 'draft'),
('CHI', 'chi', 'Chine', 'CHINA Air', NULL, 'draft'),
('FRE1', 'beaubourg', 'France', 'Air France', 17, 'draft'),
('FRE2', 'paris', 'France', 'Air Electric', 22, 'draft'),
('SIN', 'pasir', 'Singapour', 'SIN A', 15, 'draft');
```

## Insertion des données des pilotes

Insérez les pilotes suivants dans la table `pilotes` :

```text
+-------------+-----------+----------+--------+---------------------+
| certificate | num_flying | company | name   | created             |
+-------------+-----------+----------+--------+---------------------+
| ct-1        |      90.0 | AUS      | Alan   | 2020-02-04 12:50:52 |
| ct-10       |      90.0 | FRE1     | Tom    | 2020-02-04 12:50:52 |
| ct-100      |     200.0 | SIN      | Yi     | 2020-02-04 12:50:52 |
| ct-11       |     200.0 | AUS      | Sophie | 2020-02-04 12:50:52 |
| ct-12       |     190.0 | AUS      | Albert | 2020-02-04 12:50:52 |
| ct-16       |     190.0 | SIN      | Yan    | 2020-02-04 12:50:52 |
| ct-56       |     300.0 | AUS      | Benoit | 2020-02-04 12:50:52 |
| ct-6        |      20.0 | FRE1     | John   | 2020-02-04 12:50:52 |
| ct-7        |      80.0 | CHI      | Pierre | 2020-02-04 12:50:52 |
+-------------+-----------+----------+--------+---------------------+
```

Utilisez le code suivant pour insérer les données des pilotes :

```sql
INSERT INTO pilots (certificate, num_flying, company, name, created)
VALUES
    ('ct-1', 90, 'AUS', 'Alan', CURRENT_TIMESTAMP),
    ('ct-10', 90, 'FRE1', 'Tom', CURRENT_TIMESTAMP),
    ('ct-100', 200, 'SIN', 'Yi', CURRENT_TIMESTAMP),
    ('ct-11', 200, 'AUS', 'Sophie', CURRENT_TIMESTAMP),
    ('ct-12', 190, 'AUS', 'Albert', CURRENT_TIMESTAMP),
    ('ct-16', 190, 'SIN', 'Yan', CURRENT_TIMESTAMP),
    ('ct-56', 300, 'AUS', 'Benoit', CURRENT_TIMESTAMP),
    ('ct-6', 20, 'FRE1', 'John', CURRENT_TIMESTAMP),
    ('ct-7', 80, 'CHI', 'Pierre', CURRENT_TIMESTAMP);
```

[exercices](./chap4_exercices.md)