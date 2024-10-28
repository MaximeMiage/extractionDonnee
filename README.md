# extractionDonnee
Projet configuration d'un poste de travail

Si vous arrivez sur cette étape, merci de ne tenter aucune maniuplation sur le dépôt pour eviter de la degrader. Lors de notre prochain entre vu je vous expliquerez les commandes les plus importantes. Vous pouvez commencer par installer GitHub Desktop sur votre ordianateur.

Configuration d'une tache cron.

Ouvrir le crontab et ajouter cette ligne : 0 1 * * * /extractionDonnee/Extracteur_meteo.sh

Cette ligne, une fois ajouté au crontab, permettra d'exécuter le script Extracteur_meteo.sh tout les jours à 1h.