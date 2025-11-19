#!/bin/bash


data=$(date +"%Y-%m-%d_%H-%M-%S") # Creació d’una variable per la data
fitxer="informe_sistema_$data.txt"  # Creació d’una variable pel nom del fitxer a crear


echo ""
echo "Tria quina informació del sistema vols veure:"
echo ""
echo "1. Informació General"
echo "2. Ús de CPU i memòria"
echo "3. Espai en disc"
echo "4. Xarxa"
echo "5. Serveis actius"
echo "6. Tota la informació"
echo ""
read -p "Escull una opció: " num


echo ""


echo "" >> $fitxer
echo "--- INFORME BÀSIC DEL SISTEMA ---" >> $fitxer
echo "--- Generat el: $(date) ---" >> $fitxer
echo "" >> $fitxer


if [[ $num -eq 1 ]]; then
        echo "--- Informació General ---"
        echo "Nom de l'equip: $(hostname)"
        echo "Usuari actual: $(whoami)"
        echo "Temps actiu: $(uptime -p)"
        echo ""
fi >> $fitxer # Utlització de comandes bàsiques per obtenir el nom de l’equip, l’usuari i el temps actiu


cpu=`top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}'` # Variable creada per obtenir l’us de la cpu a partir d’un top, filtrat per només les Cpu(s) i només imprimeix les paraules 2 i 4 fent referència al parcentatge de CPU de l’usuari i del sistema


if [[ $num -eq 2 ]]; then
        echo "--- Ús de CPU i Memòria ---"
        echo "CPU Actual: $cpu"
        echo ""
fi >> $fitxer


if [[ $num -eq 3 ]]; then
        echo "--- Espai en el disc ---"
        df -h | grep -E '^/dev/' # Filtra només les particions reals del sistema
        echo ""
fi >> $fitxer


ip=`hostname -I | awk '{print $1}'` # Variable que agafa la IP de l’ordinador que esta executant l’script


if [[ $num -eq 4 ]]; then
        echo "--- Xarxa ---"
        echo "Adreça IP: $ip"
        ping -c 1 8.8.8.8 &> /dev/null # Fa un ping a google on només agafa la primera resposta, si aquesta no dona resolució es guarda a /dev/null
        if [[ $? -eq 0 ]]; then # Comprova que a /dev/null no hi hagi res, si s’ha guardat algo, detectarà que no hi ha connexió a internet
                echo "Hi ha Connexió a Internet"
        else
                echo "NO hi ha Connexió a Internet: ERROR!"
        fi
        echo ""
fi >> $fitxer


if [[ $num -eq 5 ]]; then
        echo "--- Serveis Prinicipals Actius ---"
        systemctl list-units --type=service --state=running | head -n 15 # Fa un llistat del serveis que hi ha actius en el sistema i agafa els 15 primers
        echo ""
fi >> $fitxer


if [[ $num -eq 6 ]]; then
        echo "--- Informació General ---"
        echo "Nom de l'equip: $(hostname)"
        echo "Usuari actual: $(whoami)"
        echo "Temps actiu: $(uptime -p)"
        echo ""


        echo "--- Ús de CPU i Memòria ---"
        echo "CPU Actual: $cpu"
        echo ""


        echo "--- Espai en el disc ---"
        df -h | grep -E '^/dev/'
        echo ""


        echo "--- Xarxa ---"
        echo "Adreça IP: $ip"
        ping -c 1 8.8.8.8 &> /dev/null
        if [[ $? -eq 0 ]]; then
                echo "Hi ha Connexió a Internet"
        else
                echo "NO hi ha Connexió a Internet: ERROR!"
        fi
        echo ""


        echo "--- Serveis Prinicipals Actius ---"
        systemctl list-units --type=service --state=running | head -n 15
        echo ""
fi >> $fitxer


echo "El informe ha sigut generat, el fitxer és diu $fitxer"


echo "El informe generat conté:"


echo "" >> $fitxer


cat $fitxer
