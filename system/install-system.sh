#!/usr/bin/env bash
# Ajustes de sistema (requiere root): tema SDDM + cambio de display manager.
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Ejecuta con sudo: sudo $0" >&2
  exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Usuario real que invoca sudo (para localizar su kwinoutputconfig.json)
REAL_HOME=$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6)

# 1. Tema SDDM
mkdir -p /usr/share/sddm/themes
cp -r "$DIR/sddm/where_is_my_sddm_theme" /usr/share/sddm/themes/
echo "tema:   /usr/share/sddm/themes/where_is_my_sddm_theme"

# 2. Configuración SDDM (tema + greeter wayland)
mkdir -p /etc/sddm.conf.d
cp "$DIR/sddm/10-neon-grid.conf" /etc/sddm.conf.d/
echo "conf:   /etc/sddm.conf.d/10-neon-grid.conf"

# 3. Resolución del greeter: heredar la configuración de pantalla del usuario
if [[ -f "$REAL_HOME/.config/kwinoutputconfig.json" ]]; then
  install -D -o sddm -g sddm -m 0644 \
    "$REAL_HOME/.config/kwinoutputconfig.json" \
    /var/lib/sddm/.config/kwinoutputconfig.json
  echo "res:    kwinoutputconfig.json copiado al usuario sddm"
fi

# 4. Cambiar de display manager (efectivo en el próximo arranque)
if systemctl is-enabled plasmalogin.service &>/dev/null; then
  systemctl disable plasmalogin.service
  echo "dm:     plasmalogin desactivado"
fi
systemctl enable sddm.service
echo "dm:     sddm activado (se aplicará al reiniciar)"
