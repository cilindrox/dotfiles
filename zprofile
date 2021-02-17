export NPM_TOKEN=''
export DOCKER_HOST=ssh://homelab

export http_proxy=socks5h://localhost

eval $(/opt/homebrew/bin/brew shellenv)

# PGP
# https://github.com/keybase/keybase-issues/issues/1712#issuecomment-141226705
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export EDITOR='nvim'

# Colored LESS output
export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'   # begin underline

HOMEBREW_PREFIX="/opt/homebrew"

export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"

export GOPATH=$HOME/go

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

path=(
  $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  $HOMEBREW_PREFIX/opt/curl/bin
  $HOME/{.local,.cargo,go}/bin
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOME/.zsh/pure
  $HOMEBREW_PREFIX/opt/curl/share/zsh/site-functions
  $fpath
)

# Typecast to set and remove dupes.
typeset -U PATH FPATH

# EOF
