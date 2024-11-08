# DQL

## Fonctions de groupe

Elles s'utilisent dans la clause SELECT sur une/des colonnes, elles permettent de regrouper des données. Si vous utilisez les fonctions de groupement avec une requête ne contenant pas de clause GROUP BY, cela revient à grouper toutes les lignes.

```sql
AVG([DISTINCT] exp)       -- moyenne
COUNT({*| DISTINCT] exp}) -- nombre de lignes
MAX([DISTINCT] exp)       -- max
MIN([DISTINCT] exp)       -- min
SUM([DISTINCT] exp)       -- somme
GROUP_CONCAT(exp)         -- composition d'un nombre de valeurs, concaténation de valeurs de champ a, b, c, d
VARIANCE(exp)             -- variance
STDDEV(exp)               -- écart type (standard deviation)
```


## Groupement de lignes

```sql
SELECT col1 [,col2, ...], fonction_groupe
FROM table
WHERE (conditions)
**GROUP BY clo1 [, col2, ...]**
HAVING condition_02
ORDER BY col1 [ASC | DESC] [, col2 ...]
LIMIT
```

- La clause `WHERE` exclut des lignes pour chaque groupement ou permet de rejeter des groupements entiers. Elle s'applique à la totalité de la table.

- La clause `GROUP BY` liste des colonnes de groupement.

- La clause `HAVING` permet de poser des conditions sur chaque groupement.

Attention, les colonnes présentes dans le `SELECT` doivent apparaître dans le `GROUP BY`. Seules des fonctions ou expressions peuvent exister en plus dans le `SELECT`.

### Exemple avec `HAVING` et `WHERE`

Supposons que nous ayons une table `sales` avec les colonnes suivantes :

```sql
CREATE TABLE `sales` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `product` VARCHAR(50),
    `quantity` INT,
    `price` DECIMAL(10, 2)
);
```

La clause `WHERE` est utilisée pour filtrer les lignes avant l'agrégation. Par exemple, si nous voulons obtenir le total des ventes pour les produits ayant un prix supérieur à 50 :

```sql
SELECT product, SUM(quantity * price) AS total_sales -- notez que l'on peut faire des calculs dans la fonction d'agrégation !
FROM sales
WHERE price > 50 -- filtre par rapport à l'ensemble des données
GROUP BY product;
```

- Ici, `WHERE price > 50` filtre les lignes où le `price` est supérieur à 50 avant de les regrouper par produit.
- La clause `GROUP BY` regroupe ensuite les lignes par `product`, et `SUM(quantity * price)` calcule le total des ventes pour chaque produit ayant un prix unitaire supérieur à 50.

### Exemple avec `HAVING`

La clause `HAVING` est utilisée pour filtrer les résultats après l'agrégation. Par exemple, si nous voulons voir les produits dont le total des ventes est supérieur à 500 (peu importe le prix unitaire de chaque vente) :

```sql
SELECT product, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product
HAVING total_sales > 500;
```

- Ici, nous n'appliquons aucun filtre avant l'agrégation.
- La clause `GROUP BY` regroupe les lignes par `product`, et `SUM(quantity * price)` calcule le total des ventes pour chaque produit.
- Ensuite, `HAVING total_sales > 500` filtre les groupes (produits) dont le total des ventes est supérieur à 500.

### Résumé

- **`WHERE`** : filtre les lignes avant l'agrégation.
- **`HAVING`** : filtre les résultats après l'agrégation.


## 01 Exercices group by

01. **Exercice moyenne des heures de vol**

Calculez la moyenne des heures de vol pour chaque compagnie.

02. **Exercice moyenne et bonus**

Calculez la moyenne des heures de vol des pilotes dont le bonus est de 500, par compagnie.

03. **Exercice nombre de pilotes**

Sélectionnez les compagnies ayant plus d'un pilote, ainsi que leur nombre de pilotes.

04. **Exercice ajout d'une colonne & valeurs**

*Si vous n'avez pas fait les exercices supplémentaires. Vous devez faire ce qui suit, sinon passer à la suite.*

Cette requête doit assigner à chaque pilote un type d'avion en fonction de la compagnie pour laquelle il travaille, avec la logique suivante :

A380 pour les compagnies dans les ensembles (ABCD, WXYZ, EFGH) et (GHIK, LMNO, PQRS).
A320 pour (IJKL, MNOP, QRST) et (TUVW, XYZA, BCDE).
A340 pour (UVWX, YZAB, CDEF) et (FGHI, JKLM, NOPQ).

1.  **Exercice sélectionner pilotes & compagnies**

Sélectionnez le nombre de pilotes par compagnie et par type d'avion.

06. **Exercice noms de pilotes**

Sélectionnez le nom des pilotes par bonus.

Sélectionnez le nom et la compagnie des pilotes par bonus.

07. **Exercice étendue**

Calculez l'étendue (différence entre MAX et MIN) du nombre d'heures de vol par compagnie.

08. **Exercice moyenne et nombre de jours**

Faites la somme du nombre de jours de vols par compagnie dont la somme est supérieure à 30.

09. **Exercice moyenne des heures de vol**

Afficher la moyenne des heures de vol pour les compagnies qui sont à `NY`.

## ROLLUP

La clause `WITH ROLLUP` s'ajoute après un `GROUP BY` permet de créer des regroupement combinés.

Prenons un exemple standard :

```sql
SELECT company, plane, COUNT(*) AS nb_pilots
FROM pilots
GROUP BY company, plane;

-- +---------+-------+-----------+
-- | company | plane | nb_pilots |
-- +---------+-------+-----------+
-- | AUS     | A380  |         4 |
-- | FRE1    | A320  |         2 |
-- | SIN     | A320  |         1 |
-- | SIN     | A340  |         1 |
-- | CHI     | A340  |         1 |
-- +---------+-------+-----------+
```

Avec la clause `WITH ROLLUP`, cela permettra d'obtenir une ligne supplémentaire pour chaque groupe avec la valeur agrégée d'une seule colonne :

> *La valeur NULL sur une colonne indique la présence d'une ligne supplémentaire*

```sql
SELECT company, plane, COUNT(*) AS nb_pilots
FROM pilots
GROUP BY company, plane WITH ROLLUP;

-- +---------+-------+-----------+
-- | company | plane | nb_pilots |
-- +---------+-------+-----------+
-- | AUS     | A380  |         4 |
-- | AUS     | NULL  |         4 |	<-- Total du groupe 'AUS' (1 pilote)
-- | CHI     | A340  |         1 |
-- | CHI     | NULL  |         1 |  <-- Total du groupe 'CHI'
-- | FRE1    | A320  |         2 |
-- | FRE1    | NULL  |         2 |  <-- Total du groupe 'FRE1'
-- | SIN     | A320  |         1 |
-- | SIN     | A340  |         1 |
-- | SIN     | NULL  |         2 |  <-- Total du groupe 'SIN' (2 pilotes)
-- | NULL    | NULL  |         9 |	<-- Total de l'ENSEMBLE (9 pilotes)
-- +---------+-------+-----------+
```

Cela peut être pratique pour éviter des calculs supplémentaires dans la partie applicative (code serveur).

## 02 Exercices sales et découverte des procédures

1. Créez la table sales, elle représente la table des dépenses. Mettez à jour cette table avec les données suivantes :

**Création de la table sales référencée à la table companies, avec les champs suivants**

id : bigint unsigned auto increment
year_month : datetime
company : clé étrangère référencée à la table companies
profit : champ décimal de 10 chiffres avec 2 chiffres après la virgule.

2. Procédure découverte 

Nous allons découvrir une méthode pour hydrater la table sales : une procédure SQL, sorte de fonction que nous appelerons dans la console MySQL pour exécuter un script. Voici ci-dessous un exemple de procédure :

```sql
DELIMITER $$

DROP PROCEDURE IF EXISTS calculate;
CREATE PROCEDURE calculate(IN x INT, IN y INT, OUT sum INT)
BEGIN
  SET sum = x + y;
END $$;
DELIMITER ;

-- Appel de la procédure dans la console mysql
call calculate(1, 2, @s);
SELECT @s;
```

Nous vous donnons cette première procédure afin de découvrir la syntaxe SQL pour l'implémenter dans votre code, ATTENTION pensez à bien échapper le champ year_month avec les apostrophes simples

```sql

-- change le délimiter pour créer la procédure
DELIMITER $$

DROP PROCEDURE IF EXISTS set_data$$
CREATE PROCEDURE set_data(IN  comp CHAR(4))
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE d DATE DEFAULT '1980-01-01';
  loop_data : LOOP

    IF (i = 20*12) THEN
        LEAVE loop_data;
    END IF;

    INSERT INTO 
    `sales` (created_at, company, profit) VALUES ( d, comp, ROUND(RAND()*15 * 100000, 2 ));

    SET d = DATE_ADD(d, INTERVAL 1 MONTH);
    SET i = 1 + i;
  END LOOP; 
END$$

-- rétablit le délimiter dans la console
DELIMITER ;

call set_data('AUS');
call set_data('CHI');
call set_data('SIN');
call set_data('FRE1');
call set_data('ITA');
```

## Exercice procédure

- Créez une procédure stockée, pour la table `pilots` permettant de retourner des enregistremetnts, en fonction d'une limite à passer en paramètre à votre procédure.

```sql
call getPilotsByLimit(10);

DELIMITER //
DROP PROCEDURE IF EXISTS getPilotsByLimit //

CREATE PROCEDURE getPilotsByLimit(IN  lim INT)
  BEGIN
    SELECT `company`, `name`
    FROM `pilots`
    ORDER BY `name` DESC
    LIMIT lim;
  END //

DELIMITER ;
```

Pour appeler la procédure 

```sql
call getPilotsByLimit(10) ;
```
+---------+------------------+
| company | name             |
+---------+------------------+
| TUVW    | Zachary Perry    |
| PQRS    | Yasmin Bell      |
| LMNO    | Xander Hughes    |
| GHIK    | Walter Morris    |
| CDEF    | Victoria Edwards |
| YZAB    | Ulysses Martin   |
| UVWX    | Tina Carter      |
| RSTU    | Samuel Turner    |
| NOPQ    | Rachel Foster    |
| JKLM    | Quentin Reed     |
+---------+------------------+