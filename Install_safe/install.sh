!/bin/bash

#Autosudo
if [ "$EUID" -ne 0 ]; then
    echo "Se requieren permisos especiales para la instalación"
    sudo "$0" "$@"

# Función para ignorar las lineas vacías
leer_paquetes(){
    grep -v '^#' "$1" | grep -v '^$'
}

echo "Actualizando el sistema"
sudo pacman -Syu --noconfirm
echo "Iniciando instalación de paquetes pacman"

if [ -f "pacman.txt" ]; then
    echo "Instalando, por favor espere..."
    mapfile -t OFICIALES < <(leer_paquetes pacman.txt)
    sudo pacman -S --needed --noconfirm "${OFICIALES[@]}"
else 
    echo "Error: pacman.txt no encontrado."
fi

echo "Verificando si tienes yay."

if ! command -v yay &> /dev/null; then
    echo "Instalando yay para soporte de AUR..."
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
fi

if [ -f "yay.txt" ]; then
    echo "Instalando yay"
    mapfile -t AUR < <(leer_paquetes yay.txt)
    yay -S --needed --noconfirm "${AUR[@]}"
else
    echo "Error: yay.txt no encontrado"
fi

echo "---PROCESO TERMINADO---"



