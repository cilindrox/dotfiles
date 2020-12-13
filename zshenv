export EDITOR='nvim'

# Colored LESS output
export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'   # begin underline

# GNU utils PATH $(brew --prefix coreutils)
brew_path='/usr/local/opt/coreutils/libexec'
export MANPATH="$brew_path/gnuman:$MANPATH"
export GOPATH=$HOME/go
export KUBECONFIG="$HOME/.kube/config"
path=(
  $brew_path/gnubin
  /usr/local/{bin,sbin,go/bin}
  /usr/{bin,sbin}
  $GOPATH/bin
  $path
)

typeset -U PATH

# PGP
# https://github.com/keybase/keybase-issues/issues/1712#issuecomment-141226705
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# EOF
