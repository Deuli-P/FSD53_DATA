
### Exercices MySQL : Gestion des Tables

### Exercice 1 : Modifier la table `companies`

**Objectif :** Apprendre à modifier une table existante en ajoutant, supprimant et déplaçant des colonnes.

1. **Ajoutez une nouvelle colonne `status` :**
   - Type : `ENUM`
   - Valeurs possibles : `'published'`, `'unpublished'`, `'draft'`
   - Valeur par défaut : `'draft'`
   ```sql
   ALTER TABLE companies 
   ADD COLUMN `status` ENUM ('published', 'unpublished', 'draft') DEFAULT 'draft';
   ```

2. **Ajoutez également la colonne `num_street` :**
   - Type : `INT`
   ```sql
   ALTER TABLE companies 
   CHANGE `num_street` `num_street` INT;
   -- si des données 
   UPDATE companies SET num_street = NULL ;
   ```

3. **Supprimez la colonne `num_street` et recréez-la :**
   - Cette fois, placez-la après la colonne `name` dans la table `companies`.
   ```sql
   ALTER TABLE companies 
   DROP COLUMN `num_street`;
   
   ALTER TABLE companies 
   ADD COLUMN `num_street` INT AFTER `name`;
   ```

4. **Autre méthode : Déplacer la colonne existante `num_street` (si elle contient déjà des données) :**
   - Utilisez la commande `CHANGE` pour déplacer la colonne sans la supprimer.
   ```sql
   -- Sans données pour le champ num_street.
   ALTER TABLE companies 
   CHANGE COLUMN `num_street` `num_street` INT AFTER `name`;

   -- Si vous avez déjà des données dans la table dans le champ num_street, assigné NULL au champ num_street.
   ALTER TABLE companies 
   CHANGE COLUMN `num_street` `num_street` INT AFTER `name`;
   UPDATE companies SET num_street = NULL ;

   -- Si le champ ne peut être NULL, ATTENTION perte de données.
   ALTER TABLE companies DROP num_street ;
   ALTER TABLE companies 
   CHANGE COLUMN `num_street` `num_street` INT AFTER `name`;
   ```

---

### Exercice 2 : Créer la table `pilots`

**Objectif :** Créer une nouvelle table avec des contraintes.

1. **Créer la table `pilots` :**
   ```sql
   CREATE TABLE `pilots` (
       `certificate` VARCHAR(6),
       `num_flying` DECIMAL(7,1),
       `company` CHAR(4),
       `name` VARCHAR(20) NOT NULL,
       CONSTRAINT pk_pilots PRIMARY KEY (`certificate`),
       CONSTRAINT uk_name UNIQUE (`name`)
   ) ENGINE=InnoDB;
   ```

2. **Ajouter une contrainte de clé étrangère :**
   - Liez la colonne `company` à la colonne `comp` de la table `companies`.
   ```sql
   ALTER TABLE pilots 
   ADD CONSTRAINT fk_pilots_company 
   FOREIGN KEY (company) REFERENCES companies(`comp`);
   ```

---

### Exercices supplémentaires

#### Exercice 3 : Créer la table `flights`

**Objectif :** Créer une table pour enregistrer les informations sur les vols.

```sql
CREATE TABLE `flights` (
    `flight_id` INT AUTO_INCREMENT,
    `pilot_certificate` VARCHAR(6),
    `departure` DATETIME,
    `arrival` DATETIME,
    PRIMARY KEY (`flight_id`),
    FOREIGN KEY (`pilot_certificate`) REFERENCES pilots(`certificate`)
) ENGINE=InnoDB;
```

#### Exercice 4 : Ajouter une colonne à une table existante

**Objectif :** Ajouter une colonne `duration` à la table `flights` pour stocker la durée du vol en minutes.

```sql
ALTER TABLE flights 
ADD COLUMN `duration` INT;
```

