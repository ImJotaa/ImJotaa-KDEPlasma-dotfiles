# zsh — Neon Grid
# Paleta: ~/dotfiles/colors.md

# ── Entorno ───────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim

# ── Historia ──────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# ── Opciones ──────────────────────────────────────────────────
setopt AUTO_CD INTERACTIVE_COMMENTS
unsetopt BEEP

# ── Completado ────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # insensible a mayúsculas
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# ── Teclas ────────────────────────────────────────────────────
bindkey -e
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ── Prompt (neón, minimalista) ────────────────────────────────
# ┌ user@host ~/ruta (git)
# └ ❯
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{#b967ff}(%b)%f'
setopt PROMPT_SUBST
PROMPT=$'%F{#ff2a6d}┌%f %F{#05d9e8}%n%f%F{#6f6a8f}@%f%F{#05d9e8}%m%f %F{#dee4ff}%~%f${vcs_info_msg_0_}\n%F{#ff2a6d}└ %(?.%F{#05ffa1}.%F{#ff3864})❯%f '

# ── Aliases ───────────────────────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias ff='fastfetch'
alias music='spotify_player'
alias dots='cd ~/dotfiles'

# ── Plugins (paquetes de repo) ────────────────────────────────
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6f6a8f'

# ── Fetch al abrir terminal interactiva ───────────────────────
[[ $- == *i* ]] && command -v fastfetch >/dev/null && fastfetch
