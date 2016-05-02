# Go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 10000

# Ruby
eval "$(rbenv init -)"

# Git
alias git=hub

# iTerm
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
DISABLE_AUTO_TITLE="true"
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Locale
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# Brew
export PATH=$PATH:/usr/local/sbin

#oh-my-zsh
plugins+=(zsh-completions)
autoload -U compinit && compinit
