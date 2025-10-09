#!/bin/bash

# Principals variables globals
echo "Principals varibles globals del Shell:"
echo "HOME=$HOME"
echo "USER=$USER"
echo "SHELL=$SHELL"
echo "PWD=$PWD"
echo "PATH=$PATH"
echo "UID=$UID"
echo "------------"

# Arguments de Shell
echo "Arguments passats al script:"
echo "\$0 = $0"
echo "\$# = $#"
echo "------------"

echo "Valor retornat per l'ultima ordre executada: $?"
echo "------------"

echo "PID del Shell actual: $$"
