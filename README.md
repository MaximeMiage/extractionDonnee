              ###Projet extraction de données

⁂ L'objectif du projet est de créer un script Shell qui permet d'extraire et de sauvegarder des informations météorologiques d'une ville donnée. Les principaux objectifs sont les           suivants : 
      • Extraction des Données Météorologiques;
      • Enregistrement des Informations;
      • Automatisation Périodique;
      • Gestion de l’Historique;
      • Fonctionnalités Supplémentaires (les variantes);
      • Utilisation de Git pour assurer le suivi des différentes étapes de développement et permettre la collaboration.

⁂ Exécution du script :

    1. Ouvrir un Terminal : 
       - Accédez au répertoire où se trouve le script `Extracteur_Météo.sh`.

    2. Rendre le Script Exécutable :
       - Si le script n'est pas déjà exécutable, vous pouvez le rendre exécutable avec la commande suivante :
                  chmod +x Extracteur_Météo.sh
            

    3. Exécuter le Script :
       - Le script accepte un argument : le nom de la ville. Pour exécuter le script, utilisez la commande suivante :
       
                 ./Extracteur_Météo.sh [Nom_de_la_Ville]
             
       - Remplacez `[Nom_de_la_Ville]` par la ville dont vous souhaitez obtenir la météo. Par exemple, pour Toulouse :
              
                 ./Extracteur_Météo.sh Toulouse
            

    4. Ville par Défaut :
       - Si aucun argument n'est fourni, le script utilisera une ville par défaut (par exemple, Paris). Vous pouvez exécuter le script sans spécifier de ville comme ceci :
                
                    ./Extracteur_Météo.sh
              

⁂ Sortie du Script :
   - Le script enregistrera les informations météorologiques dans le fichier `meteo.txt` sous le format suivant : [Date] - [Heure] - [Ville] : [Température actuelle] - [Prévision du      lendemain]


⁂ Configuration d'une tâche Cron : 
    1. Ouvrir le crontab : crontab -e  
    2. Ajouter cette ligne de commande : 
            0 1 * * * /extractionDonnee/Extracteur_meteo.sh

Cette ligne, une fois ajouté au crontab, permettra d'exécuter le script Extracteur_meteo.sh tout les jours à 1h.


⁂ Remarques importantes : 
    1. Connexion Internet : pour éxecuter le script, assurez-vous que votre connexion Internet est active, car le script doit accéder à `wttr.in` pour récupérer les données.
    2. Fichier de Log : en cas de problème, consultez le fichier `meteo_error.log` pour voir les messages d'erreur.



