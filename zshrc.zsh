# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
PATH=$PATH:$HOME/bin/
PATH=$PATH:$HOME"/.cask/bin"
PATH=$PATH:$HOME"/.nvm/versions/node/v10.15.3/bin"


# --alternate-editor=EDITOR
# if the Emacs server is not running, run the specified editor
# instead.  This can also be specified via the `ALTERNATE_EDITOR'
# environment variable.  If the value of EDITOR is the empty string,
# run `emacs --daemon' to start Emacs in daemon mode, and try to
# connect to it.
EDITOR="emacsclient --alternate-editor=''"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=powerlevel10k/powerlevel10k

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode docker docker-compose httpie git-extras zsh-autosuggestions nvm kubectl)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
bindkey -M vicmd 'K' history-incremental-search-backward
bindkey -M vicmd 'J' history-incremental-search-forward

# (directory navigation) complete .. to ../
# http://stackoverflow.com/questions/564648/zsh-tab-completion-for-cd#comment10443433_716926
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# load autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# Alias for git flow
alias gf='git flow'
compdef _git gf=git-flow
# Git stashes
alias gss="git stash save"  # needs no completion since takes no arguments.
alias gsa="git stash apply" # same thing
# Easily access personal binaries / scripts directory
PATH=$PATH:~/bin/:~/.cabal/bin/

alias dc="docker-compose"
alias e="emacsclient --no-wait"

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Enable using complicated globbing,
# such as ^dangerousFile for all but "dangerousFile"
setopt extendedglob

# Start tips taken from http://grml.org/zsh-pony/
#
# Complete words in history Control-space
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey "^@" hist-complete

# End http://grml.org/zsh-pony/

# Allow using tramp with the zsh shell.
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

[ -s "/home/mika/.dnx/dnvm/dnvm.sh" ] && . "/home/mika/.dnx/dnvm/dnvm.sh" # Load dnvm

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load pyenv automatically by adding
# the following to ~/.zshrc:

# export PATH="/home/mvilpas/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
