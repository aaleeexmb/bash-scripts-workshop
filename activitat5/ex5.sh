#!/bin/bash

until [[ -d "$directori" ]]; do
	read -p "Introdueix la ruta d'un directori: " directori
	[[ -d "$directori" ]] || echo "Error: '$directori' no és un directori vàlid"
done

echo ""
echo "Informació del directori $directori"
echo ""

echo "Permisos:"
ls -la $directori

num_arxius=`ls -p $directori | grep -v / | wc -l`
num_directoris=`ls -p $directori | grep / | wc -l`

echo "Nombre d'arxius: $num_arxius"
echo "Nombre de carpetes: $num_directoris"
echo

echo "Arxius:"
ls -p $directori | grep -v /
echo

echo "Carpetes:"
ls -p $directori | grep /
