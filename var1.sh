#Projet configutation d'un poste de travail
#Première variante
#Projet configuration d'un poste de travail
#version 1

#!/bin/bash

#Vérifier qu'on entre bien un seul argument

if [[ $# -ne 1 ]]; 
then
 echo "Veuillez saisir une seule ville ! "
 exit 1
fi

#On crée le fichier pour les tempérture et le temporaire

tempo="meteo_tempo.txt"
meteo="meteo.txt"

#On récupère les données

ville="$1"
temp_act=$(jq '.current_condition[0].temp_C' $tempo)
temp_futur=$(jq '.weather[1].hourly[0].tempC' $tempo)

#on fait une mise en forme des données

date=$(date "+%Y-%m-%d")
time=$(date "+%H:%M:%S")

#On récupère les données dans wttr.in avec curl et on les envoie dans le tempo

curl -s "wttr.in/$ville?format=%C+%t+%f+%p" > "$tempo"

#Formater la sortie

echo "$date - $time - $ville : Température actuelle : $temp_act°C - Prévision pour demain : $temp_futur" >> $meteo

echo "Les informations météorologiques ont été enregistrées dans $meteo."
