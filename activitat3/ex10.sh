#!/bin/bash

arg1=$1
arg2=$2

echo "La paraula a cercar és $arg2"

[[ ! -e $arg1 ]] && echo "El fitxer NO existeix!"

extensio="${arg1##*.}"

if [[ $extensio != txt ]] && [[ $extensio != csv ]]; then
	echo "Error! El fitxer '$arg1' NO es ni .txt ni .csv"
	exit
fi

comptador=$(grep -i -c "$arg2" "$arg1")

if [[ $comptador -eq 0 ]]; then
	echo "No s'ha trobat cap coincidència per la paraula $arg2"
else
	echo "S'han trobat $comptador línies que contenen la paraula $arg2"
fi

