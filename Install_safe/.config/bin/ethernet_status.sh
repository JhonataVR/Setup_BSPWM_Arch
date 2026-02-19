#!/bin/sh

INTERFACE="wlan0"
ICON="󰈀"

# Obtenemos la IP
IP=$(ip addr show $INTERFACE 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d/ -f1)

# Si la IP NO está vacía, mostramos la conexión
if [ -n "$IP" ]; then
    echo "%{F#2495e7}%{T4}$ICON%{T-} %{F#ffffff}$IP%{u-}"
else
    # Si está vacía, mostramos el estado desconectado
    echo "%{F#2495e7}%{T4}$ICON%{T-} %{F#ff4444}Offline%{u-}"
fi
