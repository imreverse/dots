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
# Add .zshenv to git too
# Find a way to Shift+Tab through choices
# Look into https://github.com/kutsan/zsh-system-clipboard
# Look into https://github.com/jeffreytse/zsh-vi-mode
# https://thevaluable.dev/zsh-install-configure-mouseless/
# Look into the error in which I get cannot find file ~/.zshrc
# Add antigen curl command if antigen isn't already downloaded
# Find a way to do invert selection in CLI


# Source
source "${ZDOTDIR}/plugins/antigen.zsh"

# Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen theme romkatv/powerlevel10k
antigen apply
## P10K
[[ ! -f ${ZDOTDIR}/plugins/p10k.zsh ]] || source ${ZDOTDIR}/plugins/p10k.zsh

# Aliases
alias ls="exa --classify --git --group-directories-first --icons --time-style=long-iso -lhTL1"
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
setopt extendedglob # Use invert ^ for file selection

# bindkey -v # Vi Mode Not necessary if EDITOR already set
bindkey -v '^?' backward-delete-char    # Backspace in Vi mode
bindkey '^[ ' autosuggest-accept
bindkey '^[l' history-substring-search-up
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# The following lines were added by compinstall
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"
autoload -Uz compinit; compinit
# End of lines added by compinstall
