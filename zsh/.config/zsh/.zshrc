# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ▒███████▒  ██████  ██░ ██  ██▀███   ▄████▄
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
# ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░
#   ░ ░          ░   ░  ░  ░   ░     ░ ░
# ░                                  ░
#
# TODO
# Not working kutsan/zsh-system-clipboard, instead create own paste method
# https://thevaluable.dev/zsh-install-configure-mouseless/
# Look why I'm unable to save more than 1000 line history in macos
# Add alias for updating mirrors


# Source Antigen
if ! [ -e ${ZDOTDIR}/plugins/antigen.zsh ]
then
    curl -L git.io/antigen > ${ZDOTDIR}/plugins/antigen.zsh
    echo 'Antigen Downloaded'
fi
source "${ZDOTDIR}/plugins/antigen.zsh"

# Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle Tarrasch/zsh-bd
# antigen bundle kutsan/zsh-system-clipboard
antigen theme romkatv/powerlevel10k
antigen apply
## P10K
[[ ! -f ${ZDOTDIR}/plugins/p10k.zsh ]] || source ${ZDOTDIR}/plugins/p10k.zsh

# typeset -g ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD='true'


# Yank to the system clipboard
function vi-yank-help {
    zle vi-yank
    echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-help
bindkey -M vicmd 'y' vi-yank-help

# Execute tmux when opening terminal (might be better if I use  this only for kitty?)
# Ref: unix.stackexchange.com/questions/43601
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#     exec tmux new-session -A -s MEOW
# fi

# Aliases
alias ls="exa --classify --group-directories-first --icons --time-style=long-iso -lhTL1"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias zhist="${EDITOR} ${ZDOTDIR}/.zsh_history"
alias zshrc="${EDITOR} ${ZDOTDIR}/.zshrc"
alias zupdate="curl -L git.io/antigen > ${ZDOTDIR}/plugins/antigen.zsh"
alias logout="loginctl terminate-user ${USER}"

# Options
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#444444"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD=true
setopt extendedglob                             # Use invert ^ for file selection ( rm -- ^a* )

# bindkey -v                                    # Vi Mode Not necessary if EDITOR already set
bindkey -v '^?' backward-delete-char            # Backspace in Vi mode
bindkey '^[ ' autosuggest-accept
bindkey '^[l' autosuggest-accept
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete            # Enable shift-tab

# limelight > /dev/null 2>&1;
# Enable tab completion highlighting
zstyle ':completion:*' menu select
# The following lines were added by compinstall
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"
autoload -Uz compinit; compinit
# End of lines added by compinstall
