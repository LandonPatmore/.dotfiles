# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Allows TMUX to work properly without throwing 256 color warning
export TERM="xterm-256color"

# Path to your oh-my-zsh installation. (Change based on own path)
export ZSH=/Users/lpatmore/.oh-my-zsh

# Theming
ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTIONS="false"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Personal Aliases
alias vim="vim -u /Users/lpatmore/.dotfiles/.vimrc"
alias h="history"
alias g="cd && cd go && cd src"
alias ls="ls -al"

# Git Aliases
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
alias prunelocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D"
alias count="git rev-list --count HEAD"
alias diff="git diff"
alias lg="lazygit"
alias rebase="git rebase"
alias pick="git cherry-pick"
alias show="git show"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/lpatmore/.sdkman"
[[ -s "/Users/lpatmore/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/lpatmore/.sdkman/bin/sdkman-init.sh"

