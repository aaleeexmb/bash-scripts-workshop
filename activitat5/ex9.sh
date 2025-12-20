#!/bin/bash

opcio=0

until [[ $opcio -eq 3 ]]; do
    	echo "Menú:"
    	echo "1) Mostrar data i hora actual"
    	echo "2) Comprovar si existeix un fitxer"
    	echo "3) Sortir"
    	echo ""
    	read -p "Escull una opció: " opcio
    	echo ""
    	if [ "$opcio" -eq 1 ]; then
        	echo "Data i hora actual:"
        	date
        	echo

    	elif [ "$opcio" -eq 2 ]; then
        	read -p "Introdueix la ruta del fitxer: " fitxer
        	if [ -f "$fitxer" ]; then
            		echo "El fitxer existeix."
        	else
            		echo "El fitxer NO existeix."
        	fi
        	echo

    	elif [ "$opcio" -eq 3 ]; then
        	echo "Sortint del programa..."
    	else
        	echo "Error: opció no vàlida."
        	echo
    	fi
done
