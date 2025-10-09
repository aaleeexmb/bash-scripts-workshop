#!/bin/bash

# 1.
echo "Nom d'usuari: $USER" # Utilitzant USER

usuari=`whoami`
echo "Nom d'usuari: $usuari" # Utilitzant whoami

# 2.
echo "Directori personal: $HOME" # Utilitzant HOME

directori=`pwd`
echo "Directori actual: $directori" # Utilitzant pwd

# 3.
contingut=`ls`
echo "Contingut directori actual: $contingut"

# 4.
elements=`ls | wc -l`
echo "Elements del directori: $elements"

# 5.
echo "PID del Shell: $$"

echo "Codi de retorn de l'ultima ordre: $?"
