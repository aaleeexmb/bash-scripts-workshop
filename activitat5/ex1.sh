#!/bin/bash

fitxer=Act3_parole.txt

IFS=$'\n' # Define como se separan los campos al leer una línea, haciendo que cada línea del archivo se trate como una línia completa
for linea in $(cat "$fitxer");
do
	borrar="${linea%%\#*}"
	echo "$borrar"
done > ficherosincomentarios.txt

read -p "Escribe una palabra para buscar: " palabra

existe=$(grep -Fw "$palabra" ficherosincomentarios.txt)

if [[ -n "$existe" ]]; then
	echo "La palabra/Frase existe!"
else
	echo "La palabra/Frase no existe!"
fi

read -p "Escribe una frase para el archivo: " nombre

echo "" >> ficherosincomentarios.txt

echo "$nombre" >> ficherosincomentarios.txt
