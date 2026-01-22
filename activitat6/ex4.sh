#!/bin/bash

USG_ERR=7 # Codi d’error que es retornarà quan l’ús del programa sigui incorrecte

max_dos ( ) { # Rep dos números i determina quin és el més gran
    if [ "$1" -eq "$2" ] ; then # Si són iguals, ho indica i surt del programa amb èxit
        echo 'Iguals'
        exit 0
    elif [ "$1" -gt "$2" ] ; then
        ret_val=$1
    else # Si no, guarda el valor més gran a la variable global ret_val
        ret_val=$2
    fi
}

err_str ( ) { # Mostra el missatge d’ús correcte i surt amb codi d’error
    echo "Ús: $0 <numero1> <numero2>"
    exit $USG_ERR
}

# Assignació dels paràmetres d’entrada a variables amb nom
NUM_1=$1
NUM_2=$2

if [ $# -ne 2 ] ; then # Comprova el nombre d'arguments que han de ser exactament 2
    err_str

elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then # Comprova que NUM_1 només conté dígits

    if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then # També ha de contenir només dígits
        max_dos $NUM_1 $NUM_2 # Si tots dos són números vàlids, crida la funció que calcula el màxim
        echo $ret_val # Mostra el resultat retornat per la funció
    else
        err_str # Si NUM_2 no és numèric, mostra error d’ús
    fi
else
    err_str # Si NUM_1 no és numèric, mostra error d’ús
fi

exit 0
