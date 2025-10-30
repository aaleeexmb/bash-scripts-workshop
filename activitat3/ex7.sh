#!/bin/bash

echo "Diga'm la ruta d'un fitxer:"
read fitxer

[[ ! -e $fitxer ]] && echo "El fitxer no existeix" && exit

tipus=$(file "$fitxer")
echo "Tipus del fitxer: $tipus"

[[ -r $fitxer ]] && echo "$fitxer es pot llegir"
[[ -w $fitxer ]] && echo "$fitxer es pot escriure"
[[ -x $fitxer ]] && echo "$fitxer es pot executar"

