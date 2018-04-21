# $PATH vars go here

# GNU utils PATH $(brew --prefix coreutils)
brew_path='/usr/local/opt/coreutils'
export MANPATH="$brew_path/libexec/gnuman:$MANPATH"

# Go
export GOPATH=$HOME/go

path=(
  $brew_path/libexec/gnubin
  /usr/local/{bin,sbin}
  $GOPATH/bin
  $path
)

# ruby
eval "$(rbenv init --no-rehash - zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

# PGP
# https://github.com/keybase/keybase-issues/issues/1712#issuecomment-141226705
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
