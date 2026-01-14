#!/bin/bash

echo "Analitzador de Logs"

if [[ -n "$1" ]]; then
	fitxer="$1"
else
	read -p "Introdueix el nom del fitxer de log: " fitxer
fi

until [[ -f "$fitxer" && -r "$fitxer" ]]; do
	echo "Error! El fitxer $fitxer no existeix o no es llegible!"
	read -p "Introdueix un fitxer vàlid: " fitxer
done

echo "Analitzant el Log: $fitxer"

Total_linies=$(wc -l < "$fitxer")
Error_linies=$(grep -c "ERROR" "$fitxer")
Warning_linies=$(grep -c "WARNING" "$fitxer")

echo "Total de línies: $Total_linies"
echo "Línies amb ERROR: $Error_linies"
echo "Línies amb WARNING: $Warning_linies"

read -p "Quants informes vols generar? " N

until [[ "$N" =~ ^[0-9]+$ ]] && [[ "$N" -gt 0 ]]; do
    echo "Has d'introduir un número enter positiu."
    read -p "Quants informes vols generar? " N
done

for ((i=1; i<=N; i++)); do
    echo "Total de línies: $Total_linies" > "informe_${i}.txt"
    echo "Línies amb ERROR: $Error_linies" >> "informe_${i}.txt"
    echo "Línies amb WARNING: $Warning_linies" >> "informe_${i}.txt"
done

echo "$N informes creats"
