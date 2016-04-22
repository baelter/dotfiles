export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin
eval "$(rbenv init -)"
alias git=hub
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
DISABLE_AUTO_TITLE="true"
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
