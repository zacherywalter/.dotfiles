#
# General settings
#

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_all_dups

unsetopt beep
setopt extendedglob
setopt interactivecomments
bindkey -v
bindkey -v '^?' backward-delete-char

bindkey -s '^f' "tmux-sessionizer\n"

export PATH="$HOME/.local/bin":$PATH:"$HOME/.cargo/bin"
export EDITOR=nvim

#
# compinstall
#

zstyle :compinstall filename '/home/andreas/.zshrc'
autoload -Uz compinit
compinit

#
# Prompt
#

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{magenta}[%m] %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

#
# Aliases
#

alias ssh='kitty +kitten ssh'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ..="cd .."
alias ...="cd ../.."

#
# Interfacing with other programs
#

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

. "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^l' autosuggest-accept

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
