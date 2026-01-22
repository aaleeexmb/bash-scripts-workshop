#!/bin/bash

enlace="https://www.youtube.com/watch?v=jaLDoWqIq2M"
seguir="no"

until [[ $seguir == "si" ]]; do
	echo "Quieres seguir avanzando en esta espiral de emociones, alegrías y éxitos?"
	read opcion

	case "$opcion" in
		si|SI|Si|s|S)
			seguir="si"
		;;
		no|NO|No|n|N)
			echo "Continuamos un poco más"
		;;
		*)
			echo "Opción no válida!"
		;;
	esac
done

echo "Prefecto! Aquí tienes el video:"
firefox "$enlace"
