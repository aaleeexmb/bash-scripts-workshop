#!/bin/bash

echo "Diga'm la ruta d'un fitxer:"
read fitxer

[[ -d $fitxer ]] && echo "El fitxer és un directori" && exit

[[ -f $fitxer ]] && echo "El fitxer NO és un directori" &&
	extensio="${fitxer##*.}"

echo "L'extensió del fitxer és .$extensio"
