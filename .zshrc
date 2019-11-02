source ~/Terminal/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# setting JAVA_HOME
# export JAVA_HOME=$(/usr/libexec/java_home)

### Prompt
setopt prompt_subst

autoload -U add-zsh-hook
autoload -U colors && colors

# Colors for Prompt
darkblue="$FG[033]"
green="$FG[035]"
pink="$FG[221]"
red="$FG[196]"

EMOJI=(🚀 🎨 🐳 😎 🐺 🎄 😇 🐣 🐯 🐬 😻 🎃)

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

local andrei="%{$darkblue%}A.A."
local ret_status="%(?:%{$pink%}➜ :%{$red%}➜ )"
PROMPT='%B${andrei} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) $(random_emoji) %b'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$darkblue%}git:(%{$red%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$darkblue%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$darkblue%})"

### History
setopt share_history
export HISTSIZE=1000000

### Custom commands
alias hgrep='history | grep'

function RemoveBranchesFunction() {
        git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}
function ForceRemoveBranchesFunction() {
        git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}

alias cleanBranches=RemoveBranchesFunction
alias forceCleanBranches=ForceRemoveBranchesFunction
alias gw=./gradlew

# OLD
# export SPARK_HOME="/Users/aalexandrescu/Geo/spark/python"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
