# Sous-requêtes en MySQL

Les sous-requêtes permettent d'imbriquer une requête dans une autre pour récupérer des données en fonction de critères plus complexes. En MySQL, elles doivent être placées entre parenthèses et ne comportent généralement pas de clause `ORDER BY`.

## 1. Sous-requêtes avec IN et NOT IN

La clause `IN` compare un élément à une donnée quelconque d'une liste résultant d'une sous-requête. Elle est souvent utilisée pour vérifier si une valeur existe dans une autre table.

### Exemple avec `IN`

```sql
SELECT colonne(s)
FROM mytable1
WHERE colonne(s) IN (
  SELECT colonne(s)
  FROM mytable2
);
```

**Attention à l'utilisation de `NOT IN`** : elle retourne `FALSE` si un membre de la liste retournée contient `NULL`. Pour éviter ce problème, ajoutez une condition dans la sous-requête pour exclure les valeurs `NULL`.

### Exemple avec `NOT IN`

```sql
SELECT * 
FROM pilots 
WHERE num_jobs NOT IN (
    SELECT num_street 
    FROM companies 
    WHERE num_street IS NOT NULL
);
```

---

## 2. Utilisation de la clause `ALL`

La clause `ALL` compare une valeur avec l'ensemble des valeurs retournées par une sous-requête. Elle est souvent utilisée pour vérifier qu'une condition est vraie pour toutes les valeurs de la liste.

```sql
SELECT *
FROM table1
WHERE condition > ALL (
    SELECT colonne(s)
    FROM table2
    WHERE condition2
);
```

### Exemple : Compagnies avec conditions sur les pilotes

```sql
SELECT *
FROM companies
WHERE some_column > ALL (
    SELECT hours
    FROM pilots
    WHERE company_id = companies.company_id
);
```

---

## 3. Sous-requêtes corrélées avec l'opérateur `EXISTS`

Une sous-requête corrélée fait référence à des colonnes de la requête principale, permettant une comparaison entre les lignes. Elle est fréquemment utilisée avec `EXISTS` pour tester l'existence d'une ligne répondant aux critères spécifiés.

### Exemple de sous-requête corrélée avec `EXISTS`

```sql
SELECT *
FROM t1
WHERE EXISTS (
    SELECT 1 
    FROM t2 
    WHERE t2.column2 = t1.column2
);
```

---

## Différence avec MAX et ALL

```sql

SELECT company 
FROM pilots 
WHERE num_jobs > ALL (
    SELECT num_jobs FROM pilots WHERE company = 'AUS'
);


SELECT company 
FROM pilots 
WHERE num_jobs >= (
    SELECT MAX(num_jobs) FROM pilots WHERE company = 'AUS'
);

```


## Exercices pratiques

### Exercice 01 : Liste des compagnies

1. **Coordonnées des compagnies** : Récupérez les coordonnées des compagnies qui emploient des pilotes effectuant moins de 400 heures de vol.

2. **Pilote avec le plus d'heures de vol** : Sélectionnez le pilote ayant effectué le plus d'heures de vol sans utiliser `MAX` ni `ORDER BY`. Ensuite, récupérez tous les nombres d'heures de vol sauf le plus grand.

3. **Heures de vol d'Iota Corp** : Calculez la somme des heures de vol des pilotes dont la compagnie est "Iota Corp", sans utiliser de clé primaire spécifique.

4. **Compagnies sans pilotes** : Après avoir ajouté la compagnie suivante dans la table `companies` :

   ```sql
   INSERT INTO companies (comp, street, city, name, num_street)
   VALUES ('ITA', 'mapoli', 'Rome', 'Italia Air', 20);
   ```

   Trouvez toutes les compagnies qui n'ont pas de pilotes.

5. **Comparaison avec les heures de vol de XYZA** : Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à toutes les heures de travail des pilotes de la compagnie "XYZA".

6. **Longueur des noms des pilotes** : Sélectionnez les longueurs des noms des pilotes dont la longueur de leurs noms est inférieure à toutes les longueurs des noms de la compagnie "LMNO".

```sql
ALTER TABLE pilots
ADD COLUMN plane
ENUM('A380', 'A320', 'A340') AFTER name;

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alice Brown', 'Brian Fox', 'George Hall', 'Jane White');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Diana Ross', 'Tina Carter', 'Yasmin Bell');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('YWalter Morrisan', 'Laura King');
```

7. **Pilotes des A380** : Sélectionnez les coordonnées des compagnies ayant des pilotes dont le nombre d'heures de vol est inférieur à toutes les heures de vol (chaque heure de vol) des A380.

---

### Exercice 02 : Sous-requête corrélée

1. **Adresses des compagnies sans pilotes** : Utilisez une sous-requête corrélée pour sélectionner les adresses des compagnies n'ayant aucun pilote.

2. **Adresses des compagnies avec pilotes** : Utilisez une sous-requête corrélée pour sélectionner les adresses des compagnies ayant des pilotes.

3. **Pilotes avec le même nom de famille** : Utilisez une sous-requête corrélée pour sélectionner les pilotes partageant le même nom de famille. Écrivez deux versions de cette requête.

```sql
ALTER TABLE pilots
ADD last_name VARCHAR(100) AFTER name;


UPDATE `pilots` 
SET `last_name` = (
    CASE 
        WHEN name IN ('Quentin Reed', 'Laura King', 'George Hall') THEN 'Dupont'
        WHEN name IN ('Chloe Long', 'Evan Lee') THEN 'Chai'
        WHEN name IN ('Jane White', 'Quentin Reed') THEN 'Chai'
        WHEN name IN ('Tina Carter') THEN 'Doe'
        ELSE 'Lu'
    END);
```

---

### Exercice supplémentaire : Ajout de données

```sql

UPDATE pilots SET plane = 'A380' WHERE name IN (' Zachary Perry', 'Victoria Edwards', 'Samuel Turner', 'Laura King');
UPDATE pilots SET plane = 'A320' WHERE name IN ('Ian Scott', 'Bob Smith', 'Amy Howard');
UPDATE pilots SET plane = 'A340' WHERE name IN ('Ian Scott', 'Fiona Green');
```
---

### Résumé

Les sous-requêtes sont puissantes pour manipuler des données de manière complexe en MySQL, mais elles peuvent entraîner des temps de traitement élevés. Si possible, privilégiez des jointures pour optimiser les performances, surtout en présence de grands ensembles de données.