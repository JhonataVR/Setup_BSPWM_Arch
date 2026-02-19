#!/usr/bin/env bash

# Terminar instancias previas de polybar
killall -q polybar

# Esperar a que los procesos se hayan cerrado
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar la barra "example" (así se llama en el config.ini por defecto)

polybar top &
polybar bottom &
# polybar example &
