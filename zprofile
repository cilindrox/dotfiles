export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
export PATH="/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/usr/local/share/info:${INFOPATH:-}";

# LIBVIRT_DEFAULT_URI=qemu:///system

# Fixes duplicate char when triggering completion or hist search due to unicode
# ref: https://stackoverflow.com/a/22779469/992453
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'
export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export GOPATH="$HOME/go"

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF='colordiff -N -u'

export TF_CLI_ARGS_apply="-parallelism=12"
export TF_CLI_ARGS_plan="-parallelism=12"

export YAMLLINT_CONFIG_FILE=~/.config/yamllint/config

export KUBE_PS1_CTX_COLOR='magenta'
export KUBE_PS1_DIVIDER='/'
export KUBE_PS1_ENABLED=off
export KUBE_PS1_NS_COLOR='yellow'
export KUBE_PS1_PREFIX=''
export KUBE_PS1_SUFFIX=''
export KUBE_PS1_SYMBOL_ENABLE=false

path=(
  $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  $HOMEBREW_PREFIX/opt/curl/bin
  $HOME/{.local,.cargo,go}/bin
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOMEBREW_PREFIX/opt/curl/share/zsh/site-functions
  $HOME/github/dotfiles/functions
  $fpath
)

autoload change-extension cs extract mcd replace

# Typecast to set and remove dupes.
typeset -U PATH FPATH
