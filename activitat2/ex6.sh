#!/bin/bash

echo "\$* sense cometes:"
echo $*

echo "\$* amb cometes:"
echo "$*"

echo "\$@ sense cometes:"
echo $@

echo "\$@ amb cometes:"
echo "$@"

echo "\$* sense cometes i amb cometes tracta tots els arguments com una sola string"
echo "\$@ sense cometes funciona com .S*, ja que separa els arguments amb espais"
echo "\$@ amb cometes conserva cada argument per separat, encare que contingui espais"
