## DML 

### 1. Quelle est la syntaxe correcte pour insérer plusieurs lignes dans une table MySQL ?
- [x] `INSERT INTO table VALUES (valeur_1, valeur_2), (valeur_3, valeur_4);`
- [x] `INSERT INTO table (colonne_1, colonne_2) VALUES (valeur_1, valeur_2), (valeur_3, valeur_4);`
- [ ] `INSERT INTO table VALUES ('valeur_1', 'valeur_2') AND ('valeur_3', 'valeur_4');`
- [ ] `INSERT INTO table (colonne_1, colonne_2) VALUES (valeur_1, valeur_2);`

### 2. Quel est l'inconvénient principal de la syntaxe suivante ?
```sql
INSERT INTO avions VALUES (valeur_1, valeur_2, ...);
```
- [x] Il faut renseigner que les colonnes obligatoire.
- [ ] Il faut spécifier les colonnes pour toutes les valeurs.
- [ ] Elle ne fonctionne pas dans MySQL.
- [ ] Aucune des réponses ci-dessus.

### 3. Lorsque vous insérez des données dans une table, quelles colonnes doivent être renseignées ?
- [x] Toutes les colonnes marquées `NOT NULL` doivent être renseignées.
- [ ] Seules les colonnes avec des valeurs par défaut peuvent être omises.
- [ ] Toutes les colonnes doivent être renseignées, même si elles acceptent des valeurs NULL.
- [ ] Les colonnes avec la contrainte `AUTO_INCREMENT` peuvent être omises.

### 4. Quel est le rôle de la commande `INSERT INTO` en SQL ?
- [x] Ajouter de nouvelles lignes dans une table.
- [ ] Modifier des lignes existantes dans une table.
- [ ] Supprimer des lignes dans une table.
- [ ] Créer une nouvelle table dans la base de données.
