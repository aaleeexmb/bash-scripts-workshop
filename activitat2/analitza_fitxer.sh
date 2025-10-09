#!/bin/bash

# 1.
echo "Diga'm el nom d'un fitxer:"
read fitxer

echo "Analitzant fitxer..."

echo "Procés completat! Revisa resultats.log i errors.log"

echo "---------------------------------------------------"

{

# 3.
echo "Nom del fitxer: $fitxer"

# 4.
linies=`cat $fitxer | wc -l`
echo "Nombre de linies útils: $linies"

# 5.
paraules=`cat $fitxer | wc -w`
echo "Nombre de paraules: $paraules"

# 6.
caracters=`cat $fitxer | wc -m`
echo "Nombre de caracters: $caracters"

# 7.
data=`date`
echo "Data: $data"

echo "Executat per: $USER"

directori=`pwd`
echo "Directori actual: $directori"

echo "PID del Shell: $$"

} > resultats.log 2> errors.log

echo "Contingut fitxer resultats.log:"
cat resultats.log

echo "---------------------------------------------------"
