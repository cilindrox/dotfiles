skip_global_compinit=1

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='nvim'
export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export GOPATH="$HOME/go"

export KUBECONFIG="$HOME/.kube/config"
export KUBECTL_EXTERNAL_DIFF='colordiff -N -u'

export TF_CLI_ARGS_apply='-parallelism=12'
export TF_CLI_ARGS_plan='-parallelism=12'

export YAMLLINT_CONFIG_FILE="$HOME/config/yamllint/config"

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

# Typecast to set and remove dupes.
typeset -U PATH FPATH
