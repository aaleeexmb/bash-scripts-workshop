#!/bin/bash

usuario="alexkai"   # usuario remoto
host="10.1.101.80" # IP del servidor

ejecutar() {        # función para ejecutar comandos remotos
    ssh -t "$usuario@$host" "$1"
}

comprobar() {       # función para verificar e instalar herramientas
    herramienta="$1"
    paquete="$2"
    ejecutar "command -v $herramienta >/dev/null 2>&1 || sudo apt-get update && sudo apt-get install -y $paquete"   # instala si no existe
}

echo "Comprobando herramientas necesarias en el servidor remoto!"
comprobar "nmap" "nmap"          # comprueba nmap
comprobar "lsof" "lsof"          # comprueba lsof
comprobar "df" "coreutils"       # comprueba df
comprobar "free" "procps"        # comprueba free

echo
echo "AUDITORÍA REMOTA"
echo

echo "------------------------------------------------------"

echo
echo "CPU"
ejecutar "top -bn1 | head -n 5"   # muestra uso CPU
echo

echo "------------------------------------------------------"

echo
echo "MEMORIA"
ejecutar "free -h"                # muestra memoria
echo

echo "------------------------------------------------------"

echo
echo "DISCO"
ejecutar "df -h /"                # uso del disco raíz
echo

echo "------------------------------------------------------"

echo
echo "SERVICIOS ACTIVOS"
ejecutar "systemctl --type=service --state=running | head -n 20"   # servicios en ejecución
echo

echo "------------------------------------------------------"

echo
echo "PUERTOS ABIERTOS"
ejecutar "sudo lsof -i -P -n | grep LISTEN"   # puertos en escucha
echo

echo "------------------------------------------------------"

echo
echo "NMAP"
ejecutar "sudo nmap -p- -v -Pn -T5 $host"     # escaneo completo de puertos
echo

echo "------------------------------------------------------"

echo
echo "Auditoría completada!!!"
