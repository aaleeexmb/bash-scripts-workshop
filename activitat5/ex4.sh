#!/bin/bash

echo "Usuaris amb alguna lletra majúscula al sistema:"
cat /etc/passwd | grep '^[^:]*[A-Z][^:]*:' | cut -d: -f1

echo "Introdueix un nom d'usuari existent:"
read usuari

passwd=`cat /etc/passwd | awk -F ':' '{print $1}'`

while ! echo "$passwd" | grep -qx "$usuari"; do 
	echo "Error: l'usuari '$usuari' no existeix. Torna-ho a provar:" 
	read usuari
done

echo ""

echo "Informació del compte '$usuari'"

echo ""

echo "Informació de grups"
id "$usuari"

echo ""

echo "Directori home i fitxers"
ls -la "/home/$usuari"

echo ""

echo "Shell de l'usuari"
cat /etc/passwd | grep "$usuari" | awk -F ':' '{print $7}'
