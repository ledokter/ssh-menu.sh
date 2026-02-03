#!/bin/bash

# Vérifiez si dialog est installé
if ! command -v dialog &> /dev/null
then
    echo "Le programme 'dialog' n'est pas installé. Veuillez l'installer pour exécuter ce script."
    exit 1
fi

# Fonction pour exécuter une commande et afficher le résultat
run_command() {
    clear
    echo "Exécution de la commande : $1"
    eval "$1"
    echo "Appuyez sur [Entrée] pour continuer..."
    read
}

# ASCII Art Header
cat << "EOF"

  ______      _     _           _     _   _      _   
 |  ____|    | |   | |         | |   | \ | |    | |  
 | |__   __ _| |__ | | ___  ___| |_  |  \| | ___| |_ 
 |  __| / _` | '_ \| |/ _ \/ __| __| | . `|/ _ \ __|
 | |___| (_| | |_) | |  __/\__ \ |_  | |\  |  __/ |_ 
 |______\__,_|_.__/|_|\___||___/\__| |_| \_|\___|\__|
                                                      
EOF

# Boucle principale pour afficher le menu
while true; do
    choice=$(dialog --title "Menu SSH" --menu "Choisissez une option:" 18 60 6 \
        1 "Serveur 1 (Distant)" \
        2 "Serveur 2 (Distant)" \
        3 "Serveur 3 (Distant)" \
        4 "Serveur Local 1" \
        5 "Serveur Local 2" \
        6 "Serveur Local 3" \
        3>&1 1>&2 2>&3)

    case $choice in
        1)
            run_command 'ssh -X user@153.35.39.44'
            ;;
        2)
            run_command 'ssh -X user@169.11.96.128'
            ;;
        3)
            run_command 'ssh user@149.221.135.133'
            ;;
        4)
            run_command 'ssh user@192.168.231.129'
            ;;
        5)
            run_command 'ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa root@192.168.213.169'
            ;;
        6)
            run_command 'ssh root@192.168.50.125'
            ;;
        *)
            break
            ;;
    esac
done

# Nettoyer l'écran avant de quitter
clear
echo "Au revoir!"
