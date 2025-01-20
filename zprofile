export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Fixes duplicate char when triggering completion or hist search due to unicode
# ref: https://stackoverflow.com/a/22779469/992453
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export GOPATH="$HOME/go"

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF='colordiff -N -u'

export TF_CLI_ARGS_apply="-parallelism=12"
export TF_CLI_ARGS_plan="-parallelism=12"

export YAMLLINT_CONFIG_FILE=~/.config/yamllint/config

path=(
  $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  $HOMEBREW_PREFIX/opt/curl/bin
  $HOME/{.local,.cargo,go}/bin
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOMEBREW_PREFIX/opt/curl/share/zsh/site-functions
  $HOMEBREW_PREFIX/share/zsh-completions
  $HOME/github/dotfiles/functions
  $fpath
)

autoload change-extension cs extract mcd replace kx kn tat tma tmk

# Typecast to set and remove dupes.
typeset -U PATH FPATH
