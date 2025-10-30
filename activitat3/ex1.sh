#!/bin/bash

echo "Menú:"

echo "1. Escriu un número positiu o negatiu:"
read var

if [[ $var -ge 0 ]]; then
	echo "El número passat per pantalla es Positiu"
else
	echo "El número passat per pantalla es Negatiu"
fi
