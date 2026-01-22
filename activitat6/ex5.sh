#!/bin/bash

fitxerlog="estat_serveis.log"

# Llista de servidors a comprovar
echo "Introdueix els servidors a comprovar (Ctrl+D per acabar):"

servidors=()

while read -r srv; do
    [ -z "$srv" ] && continue
    servidors+=("$srv")
done

# Missatge al fitxer dels logs
log_msg() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$fitxerlog"
}

# Fa un ping i determina l'estat del servidor
comprova_servidor() {
    local host="$1"

    ping -c 1 -W 1 "$host" &>/dev/null # Prova una connexió SSH al host amb timeout de 2s, sense demanar contrasenya, i sense mostrar sortida

    case $? in
        0)
            estat="ACTIU"
            ;;
        1)
            estat="INACTIU"
            ;;
        *)
            estat="ERROR"
            ;;
    esac
    log_msg "Servidor $host → $estat"
}

# Comprova si el servidor accepta connexions SSH
comprova_ssh() {
    local host="$1"
    ssh -o BatchMode=yes -o ConnectTimeout=2 "$host" true &>/dev/null # Prova una connexió SSH al host amb timeout de 2s, sense demanar contrasenya, i sense mostrar sortida

    if [ $? -eq 0 ]; then
        log_msg "SSH OK a $host"
    else
        log_msg "SSH FALLA a $host"
    fi
}

echo "Comprovació servidors" >> "$fitxerlog"

for srv in "${servidors[@]}"; do # Recorre tots els servidors i comprova ping + SSH
    comprova_servidor "$srv"
    comprova_ssh "$srv"
done

echo "Fi comprovació" >> "$fitxerlog"
