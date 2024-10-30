#Projet configuration d'un poste de travail

#!/bin/bash

# Vérifier qu'on entre bien un seul argument

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: $0 <ville> [format (txt/json)]"
    exit 1
fi

# Créer le fichier pour les tempértures
tempo="meteo_tempo.txt"
meteo="meteo.txt"

# Récupèrer la ville
ville="$1"
format="${2:-txt}"  # Si aucun format n'est spécifié, on utilise le format texte par défaut

# Nom du fichier d'historique pour la journée
date=$(date "+%Y-%m--%d")
historique="meteo_${date//-/}.txt"

# Récupèrer les données dans wttr.in avec curl et on les envoie dans le tempo
curl -s "wttr.in/$ville?format=j1" > "$tempo"

# Extraire les informations météo du fichier tempo
current_temp=$(jq -r '.current_condition[0].temp_C' "$tempo")
forecast_temp=$(jq -r '.weather[1].hourly[0].tempC' "$tempo")
vent=$(jq -r '.current_condition[0].windspeedKmph' "$tempo")
humidite=$(jq -r '.current_condition[0].humidity' "$tempo")
visibilite=$(jq -r '.current_condition[0].visibility' "$tempo")
prevision=$(jq -r '.weather[1].hourly[0].weatherDesc[0].value' "$tempo")


# Mise en forme des données

date=$(date "+%Y-%m-%d")
time=$(date "+%H:%M:%S")

# Enregistrer les informations en fonction du format choisi

# Enregistrer les informations en fonction du format choisi
if [[ "$format" == "json" ]]; then
    # Format JSON
    json_output=$(cat <<EOF
{
    "date": "$date",
    "heure": "$time",
    "ville": "$ville",
    "temperature": "$current_temp°C",
    "prevision": "$prevision",
    "vent": "$vent km/h",
    "humidite": "$humidite%",
    "visibilite": "$visibilite km"
}
EOF
)
    echo "$json_output" > "$historique"
    echo "Les informations météorologiques ont été enregistrées dans $historique en format JSON."
else
    # Format texte
    echo "$date - $time - $ville : Température actuelle : $current_temp°C - Prévision pour demain : $forecast_temp°C - Vent : $vent km/h - Humidité : $humidite% - Visibilité : $visibilite km" >> "$meteo"
    echo "Les informations météorologiques ont été enregistrées dans $meteo en format texte."
fi


# Nettoyage du fichier temporaire
rm "$tempo"