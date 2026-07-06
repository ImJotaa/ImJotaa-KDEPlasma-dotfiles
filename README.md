# ImJotaa · KDE Plasma dotfiles

Setup minimalista retro-cyberpunk sobre KDE Plasma (Wayland).

| Componente | Software |
| --- | --- |
| WM / DE | KDE Plasma |
| Terminal | kitty |
| Shell | zsh |
| Fetch | fastfetch |
| Archivos | Dolphin |
| Editor | Neovim |
| Navegador | Zen Browser |
| Barra | Waybar (sustituye al panel de Plasma) |
| Lanzador | Rofi |
| Bloqueo | kscreenlocker (hyprlock no funciona bajo KWin) |
| Login | SDDM |
| Música | spotify-player |

Paleta: ver [colors.md](colors.md).

## Instalación

```bash
git clone https://github.com/ImJotaa/ImJotaa-KDEPlasma-dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh        # symlinks en ~/.config
# ajustes que requieren root (SDDM):
sudo system/install-system.sh
```

Paquetes (Arch/CachyOS):

```bash
sudo pacman -S --needed kitty neovim waybar rofi sddm spotify-player \
  zen-browser-bin ttf-jetbrains-mono-nerd zsh zsh-autosuggestions \
  zsh-syntax-highlighting fastfetch
```
