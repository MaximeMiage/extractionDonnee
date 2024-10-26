#Projet configuration d'un poste de travail

#!/bin/bash

#Vérifier qu'on entre bien un seul argument

if [[ $# -ne 1 ]]; 
then
 echo "Veuillez saisir une seule ville ! "
 exit 1
fi

#On crée le fichier pour les tempértures
tempo="meteo_tempo.txt"
meteo="meteo.txt"

#On récupère la ville
ville="$1"

# Nom du fichier d'historique pour la journée
date=$(date "+%Y-%m--%d")
historique="meteo_${date//-/}.txt"

#On récupère les données dans wttr.in avec curl et on les envoie dans le tempo
curl -s "wttr.in/$VILLE?format=%C+%t+%f+%p" > "$tempo"

#On selectionne les informations qui nous interessents

current_temp=$(jq '.current_condition[0].temp_C' $tempo)
forecast_temp=$(jq '.weather[1].hourly[0].tempC' $tempo)

#on fait une mise en forme des données

date=$(date "+%Y-%m-%d")
time=$(date "+%H:%M:%S")

#on enregistrer les informations dans meteo.txt

echo "$date - $time - $ville : Température actuelle : $current_temp°C - Prévision pour demain : $forecast_temp°C" >> $meteo

echo "Les informations météorologiques ont été enregistrées dans $meteo."