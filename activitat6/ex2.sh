#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Has de pasar un nom d'usuari com a paràmetre!"
	exit
fi

usuari="$1"

echo "Menú:"
echo "1. Comprovar si té drets d'administrador"
echo "2. Comprovar si l'usuari existeix"
echo "3. Comprovar si el directori personal és vàlid"
read -p "Tria una opció: " opcio

case "$opcio" in
	1)
		if [ "$(id -u $usuari)" -eq "0" ]; then
			echo "Tens drets d'administrador!"
		else
			echo "NO tens drets d'administrador!"
		fi
	;;
	2)
		existe=`cat /etc/passwd | grep "$usuari" | awk -F ":" '{print $1}'`
		if [[ $usuari == $existe ]]; then
			echo "L'usuari Existeix!"
		else
			echo "L'usuari NO Existeix!"
		fi
	;;
	3)
		directorio=`grep "$usuari" /etc/passwd | cut -d: -f6`
		if [[ -d $directorio ]]; then
			echo "El directorio Existe!"
		else
			echo "El directorio NO Existe!"
		fi
	;;
	*)
		echo "La opció NO és vàlida"
	;;
esac
