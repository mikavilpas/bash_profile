export PATH=$PATH:/usr/bin:~/bin/
export PATH=$PATH:$HOME/.cabal/bin/
export TERM="xterm-256color"

# bash vi editing mode - Bart's Blog
# http://www.jukie.net/bart/blog/20040326082602
    set -o vi
    # ^l clear screen
    bind -m vi-insert "\C-l":clear-screen

# Handy Git bindings
# For speed >9000 coding!
#
alias gs="git status"
alias gc="git checkout"
alias gb="git branch"
alias gl="git log --stat --color"
alias gd="git diff --color"
alias gD="git diff --color --cached"
alias gm="git merge"
alias gr="git rebase"
alias gsh="git show --color"
alias gpush="git push"
alias gpush!="git push origin HEAD"
alias gpull="git pull"
alias gsm="git submodule"
alias gsmfr="gsm foreach --recursive"
