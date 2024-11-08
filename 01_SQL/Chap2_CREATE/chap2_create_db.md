# Création d'une Base de Données

Nous utiliserons **MySQL** ou **MariaDB** en adoptant principalement le moteur **InnoDB**, reconnu pour sa prise en charge des transactions et des contraintes référentielles.

## Les Moteurs de Stockage MySQL

**MySQL** propose plusieurs moteurs de stockage, chacun adapté à des besoins spécifiques :
- **MyISAM** : ne prend pas en charge les transactions, mais convient aux recherches en texte intégral.
- **InnoDB** : moteur par défaut pour la plupart des applications, avec gestion des transactions et des clés étrangères.
- **Memory** : stocke les données en RAM, adapté aux systèmes de cache temporaires.

## Modèle de Données Relationnel

### Structure de Table

Dans un modèle relationnel, une **table** organise les données en lignes (enregistrements) et en colonnes (attributs), suivant des principes théoriques d’algèbre relationnelle.

### Les Clés

- **Clé primaire** : Identifie de façon unique chaque enregistrement dans une table. Il ne peut y avoir qu'une seule clé primaire par table. Elle doit être `NOT NULL`, `UNIQUE`, et est automatiquement indexée pour des performances optimales.
  
- **Clé étrangère** : Référence une clé primaire dans une autre table pour établir une relation entre les données. Elle doit être du même type que la clé primaire qu'elle référence.


```mermaid
erDiagram
    ETUDIANTS {
        int id PK "Identifiant unique de l'étudiant"
        string nom "Nom de l'étudiant"
        string email "Email de l'étudiant"
    }

    COURS {
        int id PK "Identifiant unique du cours"
        string titre "Titre du cours"
        int etudiant_id FK "Référence à l'étudiant"
    }

    ETUDIANTS ||--o{ COURS : "a pour"
```

## Base de Données et Serveur MySQL

Une base de données est un regroupement d'objets (tables, index, vues, etc.) stockés sur le disque dur. MySQL définit aussi la notion d'**hôte** (host) pour désigner le serveur hébergeant la base de données. Vous y accéderez via un identifiant, un mot de passe, et l’adresse de l'hôte.

## Commandes Essentielles

- **Connexion** :
  ```bash
  mysql -u root -p
  ```
  Une fois connecté, pour utiliser une base de données spécifique :
  ```sql
  USE db_boston;
  ```

- **Déconnexion** :
  ```sql
  mysql> quit;
  ```

## Créer et Supprimer des Bases de Données

Vous pouvez créer une base de données avec un encodage spécifique :
```sql
CREATE DATABASE IF NOT EXISTS `db_aviation`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Pour supprimer une base :
```sql
DROP DATABASE `db_aviation`;
```

## Création d'une Table

Après avoir sélectionné la base `db_aviation`, vous pouvez créer une table comme suit :

```sql
CREATE TABLE `companies` (
    `comp` CHAR(4),
    `street` VARCHAR(20),
    `city` VARCHAR(20) NULL,
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_company PRIMARY KEY (`comp`)
) ENGINE=InnoDB;
```

Vous pouvez vérifier la structure de la table avec la commande :
```bash
mysql> DESCRIBE companies;
```

## Commandes pour Modifier la Structure d'une Table

Pour modifier une table existante, vous pouvez utiliser `ALTER` :
```sql
ALTER TABLE companies
ADD COLUMN status ENUM('published', 'unpublished', 'draft') DEFAULT 'draft';
```

Pour ajouter une colonne après une autre :
```sql
ALTER TABLE companies
ADD COLUMN num_street VARCHAR(10) AFTER name;
```

## Exercice : Créer la Table `pilots`

Créez une table `pilots` dans la base de données `db_aviation` avec les spécifications suivantes :

```sql
CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT `pk_pilots` PRIMARY KEY (`certificate`),
    CONSTRAINT unique_name UNIQUE (`name`)
) ENGINE=InnoDB;
```

Ajoutez une clé étrangère pour lier la colonne `company` de `pilots` à `comp` dans `companies` :
```sql
ALTER TABLE pilots 
ADD CONSTRAINT fk_pilots_company 
FOREIGN KEY (`company`) REFERENCES companies(`comp`);
```

Voici une version améliorée de tes exercices sur la partie CREATE de MySQL, avec une présentation plus claire et des exercices supplémentaires :

---

[exercices](./chap2_exercices.md)