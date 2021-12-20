#
# ▒███████▒  ██████  ██░ ██ ▓█████  ███▄    █ ██▒   █▓
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓█   ▀  ██ ▀█   █▓██░   █▒
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▒███   ▓██  ▀█ ██▒▓██  █▒░
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▓██▒  ▐▌██▒ ▒██ █░░
# ▒███████▒▒██████▒▒░▓█▒░██▓░▒████▒▒██░   ▓██░  ▒▀█░
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░   ▒ ▒   ░ ▐░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░░ ░░   ░ ▒░  ░ ░░
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░   ░      ░   ░ ░     ░░
#   ░ ░          ░   ░  ░  ░   ░  ░         ░      ░
# ░                                               ░

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# EDITOR
export EDITOR="nvim"
export VISUAL="nvim"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"    # History filepath
export HISTSIZE=1000000000              # Maximum events for internal history
export SAVEHIST=1000000000              # Maximum events in history file
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
