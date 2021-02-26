export NPM_TOKEN=''
export DOCKER_HOST=ssh://homelab

export http_proxy=socks5h://localhost

eval $(/opt/homebrew/bin/brew shellenv)

# PGP
# https://github.com/keybase/keybase-issues/issues/1712#issuecomment-141226705
# export GPG_TTY=$(tty)
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export EDITOR='nvim'
export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"

export GOPATH="$HOME/go"

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

path=(
  $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  $HOMEBREW_PREFIX/opt/curl/bin
  $HOME/{.local,.cargo,go}/bin
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/{zsh/site-functions,zsh-completions}
  $HOME/.zsh/pure
  $HOMEBREW_PREFIX/opt/curl/share/zsh/site-functions
  $fpath
)

# Typecast to set and remove dupes.
typeset -U PATH FPATH
