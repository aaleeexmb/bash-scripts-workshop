#!/bin/bash

valid=0

until [ $valid -eq 1 ]; do
    	read -s -p "Introdueix una contrasenya: " contra
	echo ""

    	error=0

    	if [[ ${#contra} -lt 8 ]]; then
        	echo "Error: la contrasenya ha de tenir almenys 8 caràcters!"
        	error=1
    	fi

    	if ! [[ $contra =~ [A-Z] ]]; then
        	echo "Error: la contrasenya ha de contenir almenys una lletra majúscula!"
        	error=1
    	fi

    	if ! [[ $contra =~ [0-9] ]]; then
        	echo "Error: la contrasenya ha de contenir almenys un número!"
        	error=1
    	fi

    	if [ $error -eq 0 ]; then
        	valid=1
    	fi
	echo ""
done

echo "Contrasenya vàlida!"
