#!/bin/bash

echo "Entra el path d'un directori:"
read directori

echo "Entra el nom d'un fitxer .tar:"
read fitxer

[[ -e $directori ]] && echo "El directori existeix"

[[ ! -d $directori ]] && echo "Error! No és un directori" && exit

puntotar="$fitxer.tar"

directoritar="$directori/"

if [[ -e $fitxer ]]; then
	echo "El $fitxer existeix. Vols sobreescriure les dades?"
	read sobreescriure
	if [[ $sobreescriure == no ]] && [[ $sobreescriure == No ]]; then
		echo "Perfecte! Tancant l'Script..."
		exit
	fi
	if [[ $sobreescriure == si ]] && [[ $sobreescriure == Si ]]; then
		echo "Comprimint el fitxer a .tar"
	        fitxertar=`tar -czf $puntotar $directoritar$fitxer`
	fi
else
	echo "Comprimint el fitxer a .tar"
    fitxertar=`tar -czf $puntotar $directoritar$fitxer`
fi

tipus=$(file "$puntotar")

echo "Compressió completada! El fitxer és: $tipus"
