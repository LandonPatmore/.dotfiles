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

ENABLE_CORRECTIONS="false"

COMPLETION_WAITING_DOTS="false"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Personal Aliases
alias vim="vim -u /Users/landon/.dotfiles/.vimrc"
alias h="history"
alias g="cd && cd go && cd src"
alias ls="ls -al"

# Git aliases
alias st="git status -u"
alias co="git commit"
alias add="git add"
alias push="git push"
alias branch="git branch -va"
alias log="git log --stat --pretty=medium --graph"
alias pull="git pull"
alias checkout="git checkout"
alias clone="git clone --recursive"
alias merge="git merge"
alias reset="git reset"
alias stash="git stash"
alias short="git shortlog -sne"
alias prune="git remote prune"
alias pruneL="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"
alias count="git rev-list --count HEAD"
alias diff="git diff"
alias rename="git branch -m"

# SSH Connections
alias server="ssh harrier@192.168.10.1"

export PATH="/usr/local/opt/ruby/bin:$PATH:/Users/landon/Library/Android/sdk/platform-tools:/usr/local/bin/git-extensions"
export ANDROID_HOME=/Users/landon/Library/Android/sdk
