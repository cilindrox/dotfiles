#!/bin/bash

repo_dir = `pwd`

# TODO:
# install Homebrew

# set zsh as your login shell
sudo chsh -s $(which zsh)

# link startup files
ln -s $repo_dir/zsh/dircolors ~/.dircolors
ln -s $repo_dir/zsh/aliases.zsh ~/.aliases.zsh
ln -s $repo_dir/zsh/funcs.zsh ~/.funcs.zsh
ln -s $repo_dir/zsh/prompt.zsh ~/.prompt.zsh
ln -s $repo_dir/zsh/zshrc ~/.zshrc
ln -s $repo_dir/zsh/zshenv ~/.zshenv

cp $repo_dir/git/gitconfig ~/.gitconfig

# TODO:
# brew install formulae

exit 0
