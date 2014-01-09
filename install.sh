#!/bin/bash

# This script will eventually set up your new environment.

repo_dir=$(pwd)

# TODO:
# install Homebrew

# love me sum packages
formulae="autoconf automake cmake coreutils ctags curl figlet git gource htop-osx mongodb most node python3 rbenv rbenv-aliases rbenv-default-gems rbenv-gem-rehash rbenv-vars readline redis rsync ruby-build the_silver_searcher tree wget yajl youtube-dl zsh zsh-completions zsh-history-substring-search zsh-lovers zsh-syntax-highlighting"

brew install formulae

# link restricted formulae
brew link curl --force
# brew link sqlite --force

# set zsh as your login shell
sudo chsh -s $(which zsh)

# link misc config settings
config_prefs=( gitconfig dircolors agignore gemrc )
for i in "${config_prefs[@]}"
do
  ln -s $repo_dir/prefs/$i ~/.$i
done

# link default-gem list
ln -s $repo_dir/prefs/default-gems ~/.rbenv/default-gems

# link startup files and zsh config
startup_files=( aliases.zsh funcs.zsh prompt.zsh zshrc zshenv zlogin zlogout )
for i in "${ary_prefs[@]}"
do
  ln -s $repo_dir/zsh/$i ~/.$i
done

exit 0
