# Jointures SQL

### Exercice 1
**Question** : Affichez le nom des compagnies et le nom des pilotes qui y travaillent en utilisant une jointure simple.

```sql
SELECT companies.name AS company_name, pilots.name AS pilot_name
FROM companies
JOIN pilots ON companies.comp = pilots.company;
```

### Exercice 2
**Question** : Listez tous les pilotes, même ceux sans compagnie associée, et indiquez leur `company` comme `NULL` si elle n'est pas présente dans la table `companies`.

```sql
SELECT p.name as pilot_name, c.name as company_name 
FROM pilots as p   -- table dominante on récupère les pilotes sans companies
LEFT JOIN companies as c  -- LEFT indique la table dominante ici pilots à gauche par rapport à companies 
ON c.comp = p.company;
```

### Exercice 3
**Question** : Listez toutes les compagnies et leurs pilotes, incluant les compagnies sans pilotes.

```sql
SELECT c.name AS company_name, p.name AS pilot_name
FROM pilots as p
RIGHT JOIN companies as c ON companies.comp = pilots.company;
```

### Exercice 4
**Question** : Affichez les pilotes et le nom de leur compagnie uniquement pour les compagnies situées à New York.

```sql
SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots as p
JOIN companies as c 
ON p.company = c.comp
WHERE c.city = 'New York';
```

### Exercice 5
**Question** : Affichez le nom des compagnies publiées et le nom de leurs pilotes ayant effectué plus de 1000 heures de vol.

```sql
SELECT 
    c.name AS company_name, 
    p.name AS pilot_name, 
    p.num_flying
FROM companies AS c
JOIN pilots AS p 
ON c.comp = p.company
WHERE companies.status = 'published' AND pilots.num_flying > 1000;
```

### Exercice 6
**Question** : Listez le nombre total de pilotes dans chaque ville où se trouvent des compagnies.

```sql
SELECT c.city, COUNT(p.certificate) AS total_pilots
FROM companies AS c
JOIN pilots AS p 
ON c.comp = p.company
GROUP BY c.city;
```

### Exercice 7
**Question** : Affichez le nom des compagnies et le nombre de pilotes associés pour chaque compagnie.

```sql
SELECT companies.name AS company_name, COUNT(pilots.certificate) AS total_pilots
FROM companies AS c
LEFT JOIN pilots ON companies.comp = pilots.company
GROUP BY companies.name;
```

### Exercice 8
**Question** : Affichez le nom des compagnies avec leurs pilotes et leur nombre total d'heures de vol. Triez par heures de vol décroissantes.

```sql
SELECT 
    c.name AS company_name, 
    p.name AS pilot_name, 
    p.num_flying
FROM companies AS c
JOIN pilots AS p 
ON c.comp = p.company
ORDER BY p.num_flying DESC;
```

### Exercice 9
**Question** : Listez les compagnies et le nombre de pilotes ayant un prochain vol avant le 30 novembre 2024.

```sql
SELECT 
    c.name AS company_name, 
    COUNT(p.certificate) AS pilots_before_nov_30
FROM companies AS c
JOIN pilots ON c.comp = p.company
WHERE p.next_flight < '2024-11-30'
GROUP BY c.name;
```

### Exercice 10
**Question** : Affichez le nom des compagnies et le nom des pilotes ayant un bonus supérieur à 50. Indiquez le bonus pour chaque pilote.

```sql
SELECT companies.name AS company_name, pilots.name AS pilot_name, pilots.bonus
FROM companies
JOIN pilots ON companies.comp = pilots.company
WHERE pilots.bonus > 50;
```
