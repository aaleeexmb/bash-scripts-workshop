#!/bin/bash

echo "Menú:"

echo "El número és 0? (Entra un número)"
read var

if [[ $var -eq 0 ]]; then
	echo "El número que has passat és 0"
else
	echo "El número que has passat NO és 0"
fi
