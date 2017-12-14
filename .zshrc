# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#Allows TMUX to work properly without throwing 256 color warning
export TERM="xterm-256color"

# Path to your oh-my-zsh installation. (Change based on own path)
export ZSH=/Users/landon/.oh-my-zsh

# Theming

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_COLOR_SCHEME='light'

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="false"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Personal Aliases
alias vim="vim -u /Users/landon/.dotfiles/.vimrc"
alias h="history"

# Git aliases
alias st="git status -u"
alias co="git commit"
alias add="git add"
alias push="git push"
alias br="git branch -va"
alias lo="git log"
alias pull="git pull"
alias ch="git checkout"
alias cl="git clone"
alias br="git branch"
