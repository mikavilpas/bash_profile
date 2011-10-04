export PATH=$PATH:/usr/bin
export TERM="xterm-256color"

# bash vi editing mode - Bart's Blog
# http://www.jukie.net/bart/blog/20040326082602
    set -o vi
    # ^l clear screen
    bind -m vi-insert "\C-l":clear-screen
