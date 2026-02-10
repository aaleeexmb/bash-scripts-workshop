#!/bin/bash

usuario="alexkai"   # usuario remoto
host="10.1.101.80" # IP del servidor

echo "Generant la clau SSH si no existeix"
[ ! -f ~/.ssh/id_rsa ] && ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa   # genera clave si no existe

echo "Copiant la clau pública al servidor remot"
ssh "$usuario@$host" << 'EOF'   # conecta y ejecuta comandos remotos
mkdir -p ~/.ssh                 # crea carpeta .ssh si no existe
chmod 700 ~/.ssh                # permisos seguros
EOF

cat ~/.ssh/id_rsa.pub | ssh "$usuario@$host" "cat >> ~/.ssh/authorized_keys"   # añade tu clave pública

ssh "$usuario@$host" << 'EOF'
chmod 600 ~/.ssh/authorized_keys   # fija permisos correctos
EOF

echo "Autenticació per claus configurada correctament"   # mensaje final
