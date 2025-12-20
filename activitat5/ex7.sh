#!/bin/bash

echo "Joc de Pedra, Paper o Tisores"

jugar="s"

until [[ $jugar == n ]]; do

	echo ""
	read -p "Tria (pedra, paper, tisores): " usuari

	if [[ $usuari == pedra ]] || [[ $usuari == paper ]] || [[ $usuari == tisores ]]; then
        	num=$((RANDOM%3))
        	if [[ $num -eq 0 ]]; then
			maquina="pedra"
        	elif [[ $num -eq 1 ]]; then
			maquina="paper"
        	elif [[ $num -eq 2 ]]; then
			maquina="tisores"
        	fi

        	echo "La màquina ha triat: $maquina"
		if [[ $usuari == $maquina ]]; then
			echo "Empat!!"
		elif [[ $usuari == pedra ]] && [[ $maquina == tisores ]]; then
			echo "Has Guanyat!!"
		elif [[ $usuari == paper ]] && [[ $maquina == pedra ]]; then
			echo "Has Guanyat!!"
		elif [[ $usuari == tisores ]] && [[ $maquina == paper ]]; then
			echo "Has Guanyat!!"
        	else
			echo "Has Perdut!!"
        	fi
    	else
        	echo "Opció no vàlida."
    	fi
	echo ""
    	read -p "Vols jugar un altre cop? (s/n): " jugar
done

