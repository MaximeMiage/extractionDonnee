#Projet configuration d'un poste de travail

#!/bin/bash

#Vérifier qu'on entre bien un seul argument

if [[ $# -ne 1 ]]; 
then
 echo "Veuillez saisir une seule ville ! "
fi

#On crée le fichier pour les tempérture et le temporaire
tempo="meteo_tempo.txt"
meteo="meteo.txt"
#On récupère la ville
ville="$1"

#On récupère les données dans wttr.in avec curl et on les envoie dans le tempo
curl -s "wttr.in/$VILLE?format=%C+%t+%f+%p" > "$tempo"

#On selectionne les informations qui nous interessents


