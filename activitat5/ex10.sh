#!/bin/bash

url="https://agora.xtec.cat/ies-sabadell/"

echo "Comprovant connexió..."

until ping -c 1 xtec.cat > /dev/null 2>&1; do
    	echo "No hi ha connexió a Internet."
    	echo "Tornant a provar en 5 segons..."
    	sleep 5
done

echo "Connexió establerta!"
firefox "$url" &
