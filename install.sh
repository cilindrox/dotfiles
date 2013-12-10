#!/bin/bash

# This script will eventually set up your new environment.

repo_dir = `pwd`

# TODO:
# install Homebrew

# love me sum packages
# brew install <formulae>

# link restricted formulae
# brew link curl --force
# brew link sqlite --force

# set zsh as your login shell
sudo chsh -s $(which zsh)

# link the Silver Searcher, gems and git preferences
ln -s $repo_dir/prefs/gitconfig ~/.gitconfig
ln -s $repo_dir/prefs/dircolors ~/.dircolors
ln -s $repo_dir/prefs/agignore ~/.agignore
ln -s $repo_dir/prefs/gemrc ~/.gemrc

# link startup files and zsh config
ln -s $repo_dir/zsh/aliases.zsh ~/.aliases.zsh
ln -s $repo_dir/zsh/funcs.zsh ~/.funcs.zsh
ln -s $repo_dir/zsh/prompt.zsh ~/.prompt.zsh
ln -s $repo_dir/zsh/zshrc ~/.zshrc
ln -s $repo_dir/zsh/zshenv ~/.zshenv
ln -s $repo_dir/zsh/zlogin ~/.zlogin
ln -s $repo_dir/zsh/zlogout ~/.zlogout

exit 0
