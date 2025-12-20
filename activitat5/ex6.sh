#!/bin/bash

contar=0

until [[ $contar -eq 3 ]]; do
	read -p "Introdueix un valor enter: " enter

	if [[ $enter =~ ^-?[0-9]+$ ]]; then
		if [ $contar -eq 0 ]; then
            		a=$enter
        	elif [ $contar -eq 1 ]; then
            		b=$enter
        	else
            		c=$enter
        	fi
        	contar=$((contar+1))
    	else
        	echo "No és un nombre enter!"
    	fi
done

suma=$((a+b+c))
producte=$((a*b*c))

max=$a
min=$a

if [ $b -gt $max ]; then
	max=$b
fi

if [ $c -gt $max ]; then
	max=$c
fi

if [ $b -lt $min ]; then
	min=$b
fi

if [ $c -lt $min ]; then
	min=$c
fi

echo "Suma: $suma"
echo "Producte: $producte"
echo "Més gran: $max"
echo "Més petit: $min"
