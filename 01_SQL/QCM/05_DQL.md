# DQL 

### 1. Quelle est la bonne syntaxe pour sélectionner toutes les colonnes d'une table `pilots` ?
- [ ] `SELECT * FROM pilots WHERE company='AUS';`
- [x] `SELECT * FROM pilots;`
- [ ] `SELECT name, certificate FROM pilots;`
- [ ] `SELECT DISTINCT * FROM pilots;`

### 2. La commande `SELECT DISTINCT` permet de :
- [ ] Sélectionner toutes les colonnes sans doublons
- [ ] Sélectionner uniquement des lignes dont le nom de la colonne est unique
- [x] Éviter les doublons dans les résultats
- [ ] Sélectionner toutes les colonnes sans condition

### 3. Quelle commande permet de sélectionner uniquement les pilotes ayant fait plus de 20 heures de vol dans les compagnies `GHIK` ou `AUS` ?
- [ ] `SELECT name FROM pilots WHERE company='GHIK' AND num_flying > 20;`
- [ ] `SELECT name FROM pilots WHERE company='GHIK' OR company='AUS' AND num_flying > 20;`
- [x] `SELECT name FROM pilots WHERE company IN ('GHIK', 'AUS') AND num_flying > 20;`
- [x] `SELECT name FROM pilots WHERE (company='GHIK' OR company='AUS') AND num_flying > 20;`

### 4. Quelle fonction MySQL permet de trouver le pilote ayant le meilleur bonus ?
- [x] `SELECT MAX(bonus) FROM pilots;`
- [ ] `SELECT name FROM pilots WHERE bonus = (SELECT MAX(bonus) FROM pilots);`
- [ ] `SELECT MAX(bonus) FROM pilots WHERE name='John';`
- [ ] `SELECT name FROM pilots ORDER BY bonus DESC LIMIT 1;`

### 5. Quelle est la syntaxe correcte pour ajouter une colonne `bonus` à la table `pilots` ?
- [x] `ALTER TABLE pilots ADD COLUMN bonus INT;`
- [ ] `ALTER TABLE pilots ADD bonus INT;`
- [ ] `ALTER TABLE pilots MODIFY COLUMN bonus INT;`
- [ ] `UPDATE TABLE pilots ADD COLUMN bonus INT;`

### 6. Comment restreindre la sélection aux pilotes nés après 1978 ?
- [ ] `SELECT name FROM pilots WHERE birth_date >= '1978-01-01';`
- [ ] `SELECT name FROM pilots WHERE birth_date > 1978;`
- [x] `SELECT name FROM pilots WHERE birth_date > '1978-12-31';`
- [ ] `SELECT name FROM pilots WHERE birth_date <= '1978-12-31';`

### 7. Quelle commande permet de sélectionner les pilotes dont le nom de la compagnie contient un "A" ?
- [ ] `SELECT name FROM pilots WHERE company LIKE 'A%';`
- [ ] `SELECT name FROM pilots WHERE company = '%A%';`
- [x] `SELECT name FROM pilots WHERE company LIKE '%A%';`
- [ ] `SELECT name FROM pilots WHERE company LIKE 'A';`

### 8. Quel opérateur permet de tester l'appartenance à un groupe de valeurs données dans une clause WHERE ?
- [ ] `BETWEEN`
- [ ] `LIKE`
- [x] `IN`
- [x] `IN`

### 9. Comment trier les résultats d'une requête en ordre décroissant de la colonne `name` ?
- [ ] `SELECT name FROM pilots ORDER BY name ASC;`
- [ ] `SELECT name FROM pilots ORDER BY name;`
- [x] `SELECT name FROM pilots ORDER BY name DESC;`
- [ ] `SELECT name FROM pilots ORDER BY name REVERSE;`

### 10. Quelle clause permet de limiter le nombre de lignes retournées par une requête ?
- [ ] `WHERE`
- [ ] `END`
- [x] `LIMIT`
- [ ] `ORDER BY`