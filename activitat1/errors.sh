#!/bin/bash

ls /no_existeix 2&> errors.log

echo "Alguna cosa ha fallat! Revisa errors.log"
