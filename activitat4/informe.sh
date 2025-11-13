#!/bin/bash

data=$(date +"%Y-%m-%d_%H-%M-%S")
fitxer="informe_sistema_$data.txt"

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
        echo "--- Inforamció General ---"
        echo "Nom de l'equip: $(hostname)"
        echo "Usuari actual: $(whoami)"
        echo "Temps actiu: $(uptime -p)"
        echo ""
fi >> $fitxer

cpu=`top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}'`

if [[ $num -eq 2 ]]; then
	echo "--- Ús de CPU i Memòria ---"
    echo "CPU Actual: $cpu"
    echo ""
fi >> $fitxer

if [[ $num -eq 3 ]]; then
	echo "--- Espai en el disc ---"
	df -h | grep -E '^/dev/'
	echo ""
fi >> $fitxer

ip=`hostname -I | awk '{print $1}'`

if [[ $num -eq 4 ]]; then
	echo "--- Xarxa ---"
	echo "Adreça IP: $ip"
	ping -c 1 8.8.8.8 &> /dev/null
	if [[ $? -eq 0 ]]; then
    		echo "Hi ha Connexió a Internet"
	else
    		echo "NO hi ha Connexió a Internet: ERROR!"
	fi
	echo ""
fi >> $fitxer

if [[ $num -eq 5 ]]; then
    echo "--- Serveis Prinicipals Actius ---"
	systemctl list-units --type=service --state=running | head -n 15
	echo ""
fi >> $fitxer

if [[ $num -eq 6 ]]; then
	echo "--- Inforamció General ---"
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
