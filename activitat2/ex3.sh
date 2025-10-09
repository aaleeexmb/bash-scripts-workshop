#!/bin/bash

echo "Digam el nom d'una variable global:"
read vglobal
echo "el valor de la variable és: $vglobal"

echo "-----------------------------------------"

echo "Els arguments passats a l'script son: $@"

echo "-----------------------------------------"

echo "Valor de retorn de l'última ordre: $?"

echo "-----------------------------------------"

echo "PID de la Shell actual: $$"
