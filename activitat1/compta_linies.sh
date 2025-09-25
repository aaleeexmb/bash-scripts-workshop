#!/bin/bash

# Alex
# 25/09/2025
# Aquest script consulta el fitxer passwd, compte les linies que té aquest
# fitxer i guarda el dia i les linies que té en un fitxer,
# després en un altre fitxer guarda els errors que hi ha

echo "Començant el recompte de línies útils..."

cat /etc/passwd | grep -v '^$' | wc -l > linies.log 2> errors.log

date >> linies.log



echo "Procés completat! Consulta linies.log i errors.log"
