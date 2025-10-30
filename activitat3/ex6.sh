#!/bin/bash


operacio=$1
num1=$2
num2=$3

if [[ $# -ne 3 ]]; then
	echo "error! Has d'introduir exactament 3 arguments"
fi

echo "Verificació dels intengers..."

if [[ $num1 =~ ^-?[0-9]+$ ]]; then
	echo "Intenger vàlid!"
else
	echo "Intenger NO vàlid!"
	exit
fi

if [[ $num2 =~ ^-?[0-9]+$ ]]; then
	echo "Intenger vàlid!"
else
	echo "Intenger NO vàlid!"
	exit
fi

echo "Calculadora"

if [[ $1 == + ]]; then
	resultat=$(($2+$3))
elif [[ $1 == - ]]; then
	resultat=$(($2-$3))
elif [[ $1 == x ]]; then
	resultat=$(($2*$3))
elif [[ $1 == / ]] && [[ $3 -ne 0 ]]; then
	resultat=$(($2/$3))
else
	exit
fi

echo "$2 $1 $3 = $resultat"
