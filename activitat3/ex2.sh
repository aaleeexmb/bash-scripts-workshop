#!/bin/bash

echo "Menú:"

echo "El número és negatiu? (Entra un número)"
read var

if [[ $var -lt 0 ]]; then
	echo "El número que has passat és Negatiu"
else
	echo "El número que has passat NO és Negatiu"
fi
