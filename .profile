# don't put duplicate lines or lines starting with space in the  history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Go
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 10000

# Ruby
eval "$(rbenv init -)"
RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`
export RBENV_ROOT=$HOME/.rbenv

# Git
alias git=hub
gpp() {
  git push origin && git push heroku
}
gppl() {
  gpp && heroku logs -t
}

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

# User bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/Projects/tools/bin

# Work
ptl() {
  open https://papertrailapp.com/systems/$(basename $PWD)/events
}
hkpsql() {
  psql $(URL=$(heroku config:get ELEPHANTSQL_URL); if [ -z $URL ]; then heroku config:get DATABASE_URL; else echo $URL; fi)
}
devpsql() {
  psql $(grep '\(ELEPHANTSQL_URL\|DATABASE_URL\)' .env | awk -F= '{print $2}' | sed "s/'//g" | head -n1)
}
testport4() {
  nc -4vz $*
}
testport6() {
  nc -6vz $*
}
testssl4() {
  openssl s_client -showcerts -4 -connect $* </dev/null
}
testssl6() {
  openssl s_client -showcerts -6 -connect $* </dev/null
}

export PATH=$PATH:/usr/local/bin
source '/usr/local/lib/azure-cli/az.completion'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# crystal
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
ssh-add -A &>/dev/null
