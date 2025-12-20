#!/bin/bash

echo "Escull el nom de l'arxiu:"
read arxiu

arxiutxt="$arxiu".txt

if [ ! -f "$arxiutxt" ]; then
    echo "L'arxiu no existeix. Creant $arxiutxt..."
    touch "$arxiutxt"
fi

echo "Introdueix paraules (escriu :> per acabar):"
read paraula

while [ "$paraula" != ":>" ]; do
    echo "$paraula" >> "$arxiutxt"
    read paraula
done

echo "Finalitzat!"

