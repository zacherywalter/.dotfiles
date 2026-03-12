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

zstyle :compinstall filename '/home/zachery/.zshrc'
autoload -Uz compinit
compinit

#
# Prompt [explainer](https://dev.to/cassidoo/customizing-my-zsh-prompt-3417)
#

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
# PROMPT='%F{magenta}[%m] %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
PROMPT='%F{green}%n%f%F{green}@%m%f:%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$'

#
# Aliases
#
alias s='ssh'
alias ucharging='upower -i /org/freedesktop/UPower/device/battery_BAT0'

# alias ssh='kitty +kitten ssh'
alias ma='cd ~/Nextcloud/CEL_MA/'

alias v='nvim'
alias zshrc='vim ~/.dotfiles/zsh/.zshrc'
alias vimrc='vim ~/.vimrc'
alias howto='vim ~/howto/README.md'
alias search='grep -winr ~/howto/*.md -e'

alias md='ebook-viewer --detach --new-instance %f '  # from calibre
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#
# Interfacing with other programs
#

# source /usr/share/fzf/key-bindings.zsh
# source /usr/share/fzf/completion.zsh

. "/usr/share//zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^l' autosuggest-accept

eval "$(zoxide init zsh)"
# eval "$(thefuck --alias)"

# homebrew install from brew.sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zachery/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zachery/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/zachery/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zachery/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/home/zachery/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/zachery/miniforge3';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

[ -f "/home/zachery/.ghcup/env" ] && . "/home/zachery/.ghcup/env" # ghcup-env
