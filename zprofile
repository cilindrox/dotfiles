# Ubuntu/Debian - This file should be linked as ~/.zshenv
# see: /etc/zsh/zshrc
skip_global_compinit=1

# export HOMEBREW_PREFIX="/opt/homebrew";
# export HOMEBREW_REPOSITORY="/opt/homebrew";

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}/Homebrew";

export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar";

export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin${PATH+:$PATH}";
export MANPATH="${HOMEBREW_PREFIX}/share/man${MANPATH+:$MANPATH}:";
export MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"
export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}";

# Fixes duplicate char when triggering completion or hist search due to unicode
# ref: https://stackoverflow.com/a/22779469/992453
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export GOPATH="$HOME/go"

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF='colordiff -N -u'

export LESS='-Re'

export TF_CLI_ARGS_apply='-parallelism=12'
export TF_CLI_ARGS_plan='-parallelism=12'

path=(
  $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin
  $HOMEBREW_PREFIX/opt/curl/bin
  $HOME/{.local,go}/bin
  $path
)

fpath=(
  $HOMEBREW_PREFIX/share/zsh/site-functions
  $HOMEBREW_PREFIX/opt/curl/share/zsh/site-functions
  $HOMEBREW_PREFIX/share/zsh-completions
  $HOME/github/dotfiles/functions
  $fpath
)

# Typecast to set and remove dupes.
typeset -U PATH FPATH
