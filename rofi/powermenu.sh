#!/usr/bin/env bash
# Menú de energía con rofi — Neon Grid
set -euo pipefail

options="󰐥 apagar\n󰜉 reiniciar\n󰤄 suspender\n󰌾 bloquear\n󰗽 cerrar sesión"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "energía" -theme-str 'window { width: 320px; } listview { lines: 5; }')

case "$chosen" in
    *apagar)        systemctl poweroff ;;
    *reiniciar)     systemctl reboot ;;
    *suspender)     systemctl suspend ;;
    *bloquear)      loginctl lock-session ;;
    *"cerrar sesión") qdbus6 org.kde.LogoutPrompt /LogoutPrompt org.kde.LogoutPrompt.promptLogout ;;
esac
