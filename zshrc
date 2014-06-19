# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"
 alias zshconfig="$EDITOR ~/.zshrc"
 alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

DEFAULT_USER='ranska'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git safe-paste)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# recommended by brew doctor
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin'
export PATH=$PATH:$HOME/tool_kit

eval "$(rbenv init -)"

export EDITOR='vim'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
alias tmux='tmux -2'


#source `which tmuxinator.zsh`
source ~/.nvm/nvm.sh
set -o vi
bindkey -v
#bindkey "\C-r" history-incremental-pattern-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

#[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

#[[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"      history-beginning-search-backward
#[[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}"    history-beginning-search-forward
#bindkey "^[[A" up-line-or-search
#bindkey "^[[B" up-line-or-search
alias a='TERM=xterm-256color ranger'
alias ':q'='exit'
