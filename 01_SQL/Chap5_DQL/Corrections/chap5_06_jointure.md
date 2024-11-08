
### Question 1
**Obtenir le profit total réalisé par chaque entreprise qui a des ventes.**
- **Description** : Cette requête affiche le nom de chaque entreprise avec le montant total des profits réalisés, uniquement pour les entreprises ayant effectué des ventes.

```sql
SELECT 
    c.name AS company_name, 
    SUM(s.profit) AS total_profit
FROM companies c
INNER JOIN sales s 
ON c.comp = s.company
GROUP BY c.name;
```

---

### Question 2
**Lister le nombre de pilotes associés à chaque entreprise, même pour celles sans pilote.**
- **Description** : Utiliser une jointure externe pour afficher chaque entreprise avec le nombre de pilotes qui lui sont associés. Les entreprises sans pilote auront un compte de pilotes de 0.

```sql
SELECT c.name AS company_name, COUNT(p.certificate) AS num_pilots
FROM companies c
LEFT JOIN pilots p ON c.comp = p.company
GROUP BY c.name;
```

---

### Question 3
**Trouver les entreprises qui n'ont pas réalisé de vente.**
- **Description** : Lister les entreprises sans ventes en utilisant une jointure externe.

```sql
SELECT c.name AS company_name
FROM companies c
LEFT JOIN sales s ON c.comp = s.company
WHERE s.id IS NULL;
```

---

### Question 4
**Afficher le nombre de pilotes et le profit total par entreprise pour les companies ayant des ventes et des pilotes.**
- **Description** : Utiliser une jointure interne pour obtenir uniquement les companies ayant à la fois des ventes et des pilotes, avec le nombre de pilotes et le profit total.

```sql
SELECT 
    c.comp,
    c.name AS company_name, 
    COUNT(p.certificate) AS num_pilots, 
    SUM(s.profit) AS total_profit
FROM companies AS c
INNER JOIN pilots p ON c.comp = p.company
INNER JOIN sales s ON c.comp = s.company
GROUP BY c.comp;
```

---

### Question 5
**Afficher la moyenne des heures de vol des pilotes par entreprise, même pour les entreprises sans pilote.**
- **Description** : Utiliser une jointure externe pour inclure toutes les entreprises et calculer la moyenne des heures de vol des pilotes.

```sql
SELECT c.name AS company_name, AVG(p.num_flying) AS avg_flying_hours
FROM companies c
LEFT JOIN pilots p ON c.comp = p.company
GROUP BY c.name;
```

---

### Question 6
**Lister chaque entreprise et le nombre de ventes réalisées après le 1er juin 2024.**
- **Description** : Utiliser une jointure interne pour afficher chaque entreprise ayant au moins une vente après cette date, avec le nombre de ventes.

```sql
SELECT c.name AS company_name, COUNT(s.id) AS sales_count
FROM companies c
INNER JOIN sales s ON c.comp = s.company
WHERE s.created_at > '2024-06-01'
GROUP BY c.name;
```