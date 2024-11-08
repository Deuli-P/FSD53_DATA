
### Exercices MySQL : Gestion des Tables

La notion de clé étrangère sera revue dans le cours dans un prochain chapitre.

### Exercice 1 : Modifier la table `companies`

**Objectif :** Apprendre à modifier une table existante en ajoutant, supprimant et déplaçant des colonnes.

1. **Ajoutez une nouvelle colonne `status` :**
   - Type : `ENUM`
   - Valeurs possibles : `'published'`, `'unpublished'`, `'draft'`
   - Valeur par défaut : `'draft'`


2. **Ajoutez également la colonne `num_street` :**
   - Type : `INT`
  

3. **Supprimez la colonne `num_street` et recréez-la :**
   - Cette fois, placez-la après la colonne `name` dans la table `companies`.
  

4. **Autre méthode : Déplacer la colonne existante `num_street` (si elle contient déjà des données) :**
   - Utilisez la commande `CHANGE` pour déplacer la colonne sans la supprimer.
 

### Exercice 2 (application) : Créer la table `pilots`

**Objectif :** Créer une nouvelle table avec des contraintes..

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
  
remarques : pour créer une clé étrangère

  ```sql
    FOREIGN KEY (`pilot_certificate`) REFERENCES pilots(`certificate`)
  ```

*Une clé étrangère (foreign key) est une contrainte utilisée dans les bases de données relationnelles pour établir une relation entre deux tables. Elle assure l'intégrité référentielle en garantissant qu'une valeur dans une colonne d'une table correspond à une valeur existante dans une colonne d'une autre table.*

Dans cet exemple :
- **`pilot_certificate`** est la colonne de la table (par exemple, `flights`) qui fait référence à un pilote.
- **`pilots`** est la table de référence.
- **`certificate`** est la colonne dans `pilots` qui contient les identifiants uniques des pilotes.

En résumé, les clés étrangères sont essentielles pour maintenir la structure et la fiabilité des données dans une base relationnelle.

#### Exercice 3 : Créer la table `flights`

**Objectif :** Créer une table pour enregistrer les informations sur les vols.

#### Exercice 4 : Ajouter une colonne à une table existante

**Objectif :** Ajouter une colonne `duration` à la table `flights` pour stocker la durée du vol en minutes.

