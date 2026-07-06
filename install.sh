#!/usr/bin/env bash
# Instala los dotfiles creando symlinks desde $HOME a este repo.
# Idempotente: los symlinks existentes se recrean; los archivos reales se respaldan en *.bak.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# destino -> origen (relativo al repo)
declare -A LINKS=(
  ["$HOME/.config/kitty"]="kitty"
  ["$HOME/.zshrc"]="zsh/.zshrc"
  ["$HOME/.config/fastfetch"]="fastfetch"
  ["$HOME/.config/nvim"]="nvim"
  ["$HOME/.config/waybar"]="waybar"
  ["$HOME/.config/rofi"]="rofi"
  ["$HOME/.config/spotify-player"]="spotify-player"
  ["$HOME/.config/autostart/waybar.desktop"]="plasma/autostart/waybar.desktop"
  ["$HOME/.local/share/applications/rofi-drun.desktop"]="plasma/applications/rofi-drun.desktop"
)

for target in "${!LINKS[@]}"; do
  src="$DOTFILES/${LINKS[$target]}"
  if [[ -e "$target" && ! -L "$target" ]]; then
    echo "backup: $target -> $target.bak"
    mv "$target" "$target.bak"
  fi
  mkdir -p "$(dirname "$target")"
  ln -sfnT "$src" "$target"
  echo "link:   $target -> $src"
done

echo
echo "Hecho. Los ajustes de sistema (SDDM) van aparte: ver system/README.md"
