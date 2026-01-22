#!/bin/bash

host="alex@10.1.102.30"

ssh "$host" << 'EOF'
echo "Informació del sistema"
uname -a
echo

echo "Ús de disc"
df -h
echo

echo "Processos actius"
ps aux --sort=-%cpu | head -n 5
echo

echo "Directori de treball"
pwd
ls -l
EOF
