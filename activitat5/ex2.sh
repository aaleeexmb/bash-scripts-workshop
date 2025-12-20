#!/bin/bash

positius=0
negatius=0
zeros=0

for num in "$@"; do
	if [[ $num =~ ^-?[0-9]+$ ]]; then
		if [[ $num -gt 0 ]]; then
			((positius++))
		elif [[ $num -lt 0 ]]; then
			((negatius++))
		else
			((zeros++))
		fi
	else
		echo "El número passat $num no es un nombre enter vàlid!!!"
	fi
done

echo "Resultats:"
echo "Positius: $positius"
echo "Negatius: $negatius"
echo "Zeros: $zeros"
