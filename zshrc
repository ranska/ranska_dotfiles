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
#plugins=(git)
#plugins=(git vi-mode zsh-syntax-highlighting history-substring-search)
#plugins=(git vi-mode history-substring-search)

plugins=(git git-flow vi-mode )
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
#set -o vi
#bindkey -v
#bindkey "\C-r" history-incremental-pattern-search-backward
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward

#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search

#[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

#[[ -n "${key[Up]}"      ]] && bindkey  "${key[Up]}"      history-beginning-search-backward
#[[ -n "${key[Down]}"    ]] && bindkey  "${key[Down]}"    history-beginning-search-forward
#bindkey "^[[A" up-line-or-search
#bindkey "^[[B" up-line-or-search
alias a='TERM=xterm-256color ranger'
alias 'q'='exit'



source $ZSH/custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $ZSH/custom/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
test -e ~/.dircolors && eval `dircolors -b ~/.dircolors`
#alias ls="ls --color=always" 
alias lsl="ls++" 
alias lda="ls++" 
alias ls="ls --color=always" 
alias grep="grep --color=always"
alias egrep="egrep --color=always"

alias t="tmuxifier s"
alias beb="bundle exec middleman build"
alias besy="bundle exec middleman s3_sync"
alias bes="bundle exec middleman server -p"

alias bnd="bundle exec middleman build && bundle exec middleman s3_sync"



source $ZSH/custom/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "$terminfo[cuu1]" history-substring-search-up
bindkey "$terminfo[cud1]" history-substring-search-down

bindkey "✔" history-substring-search-up
bindkey "☆" history-substring-search-down


#eval '$(dircolors -b $HOME/.dircolors)'


# Setup zsh-autosuggestions
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
# Accept suggestions without leaving insert mode
bindkey '^f' vi-forward-word
#bindkey 'é' vi-forward-word
# or
bindkey '^f' vi-forward-blank-word
#bindkey 'é' vi-forward-blank-word

bindkey "⦿" vi-forward-word
bindkey "⦿" vi-forward-blank-word


# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

export PATH="$HOME/midman_apps/creator:$PATH"

#AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=7"

# Finexcap kerl bin
export PATH="$HOME/clients/finexkap/kerl_bin/:$PATH"

# Docker config

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ranska/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Finexcap alias
alias nexkapup="rm -f Gemfile.lock && bundle install && bundle update && rake db:migrate && npm install && bower install && rspec"
alias nexkappull="git pull && rm -f Gemfile.lock && bundle install && rake db:migrate && rspec"
alias goodmorningnexkap="git pull && nexkapup"



