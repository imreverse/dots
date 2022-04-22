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
# History filepath
export HISTFILE="$ZDOTDIR/.zsh_history"
# Maximum events for internal history
export HISTSIZE=1000000000
# Maximum events in history file
export SAVEHIST=1000000000

# export path for limelight macos
export PATH="$HOME/limelight/bin:$PATH"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
