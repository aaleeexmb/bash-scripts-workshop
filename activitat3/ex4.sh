#!/bin/bash

echo "Argument 1: $1"
echo "Argument 2: $2"
echo "Argument 3: $3"

if [[ $# -ne 3 ]]; then
	echo "Error! Has d'introduir exactament 3"
fi
