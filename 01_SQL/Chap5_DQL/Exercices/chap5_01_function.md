
## Exercices chapitre 5.01

### Exercice 01 : Date de l'année dernière

Trouvez le nom du jour de la semaine exactement un an avant la date actuelle.

### Exercice 02 : Dates aléatoires

Créez des dates aléatoires entre -3 et +3 jours par rapport à la date de naissance la plus récente dans la table `pilots`.

Pour générer une date aléatoire dans cet intervalle, vous pouvez utiliser `DATE_ADD` avec une valeur aléatoire entre -3 et 3.

> **Remarque** : La fonction `RAND()` génère un nombre entre 0 et 1. Multiplier par 7 puis soustraire 3 permet de générer un entier aléatoire entre -3 et +3.

---

### Exercice 03 : Calculer l'âge moyen des pilotes

Calculez l'âge moyen des pilotes en années en utilisant leur date de naissance dans la table `pilots`. Utilisez les fonctions de date pour calculer l'âge actuel de chaque pilote, puis calculez la moyenne.

**Indice** : Vous pouvez utiliser `DATEDIFF()` pour calculer la différence entre la date de naissance et la date actuelle, puis convertir cette différence en années.

---

### Exercice 04 : Initiales des noms des pilotes

Affichez les initiales de chaque pilote en concaténant la première lettre de leur prénom (`first_name`) et la première lettre de leur nom (`last_name`). Utilisez `SUBSTRING()` pour extraire les premières lettres, puis `CONCAT()` pour les assembler.


> **Variante** : Vous pouvez aussi afficher les initiales en majuscules, même si les noms sont en minuscules, en utilisant `UPPER()`.