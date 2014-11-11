# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias vim='mvim -v'
export PS1="\[\033[31m\]A.A.: \[\033[32m\]\W\[\033[34m\]\$(parse_git_branch)\[\033[33m\] >\[\033[m\] "

# Colors for mac
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# new colorful ls
alias ls='ls -GFh'

export PATH=$PATH:~/Work/www/playActivator

# This is an alias to kill the dock if it blocks
alias resetDock="rm ~/Library/Application\ Support/Dock/*.db ; killall Dock"


