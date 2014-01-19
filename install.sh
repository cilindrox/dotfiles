#!/bin/bash
#
# TODO - This script will (eventually) set up your new environment.
#

# # #
# Function to install homebrew [ http://brew.sh ]
# # #
install_brew() {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

clear

# # #
# install Homebrew and must-have packages
# # #
hash brew 2>/dev/null || install_brew
brew update # && brew upgrade # TODO - make package upgrade optional

formulae='autoconf automake cmake colordiff coreutils ctags curl figlet git gource htop-osx mongodb most node python3 rbenv rbenv-aliases rbenv-default-gems rbenv-gem-rehash rbenv-vars readline redis ruby-build the_silver_searcher tree wget yajl youtube-dl zsh zsh-completions zsh-history-substring-search zsh-lovers zsh-syntax-highlighting'

brew install formulae

# # #
# link restricted formulae
# # #
brew link curl --force
# brew link sqlite --force

# # #
# set zsh as your login shell
# # #
sudo chsh -s $(which zsh)

# # #
# link misc config settings
# # #
repo_dir=$(pwd)

# TODO - perhaps add a backup option
#   [[ -f .$i ]] && cp $i backup/$i
# and a force flag to ln (ie. ln -fs)

config_prefs=( gitconfig dircolors agignore gemrc )
for i in "${config_prefs[@]}"
do
  ln -s $repo_dir/prefs/$i ~/.$i
done

# link default-gem list
ln -s $repo_dir/prefs/default-gems ~/.rbenv/default-gems

# link startup files and zsh config
startup_files=( aliases.zsh funcs.zsh prompt.zsh zshrc zshenv zlogin zlogout )
for j in "${startup_files[@]}"
do
  ln -s $repo_dir/zsh/$j ~/.$j
done

# # #
# Misc tool configuration
# # #

# Git: update these vars to match your username and email
username=uname
email=uname@email.com

# backup existing .gitconfig if any
# echo 'Copying git preferences'
# [[ -f $HOME/.gitconfig ]] && cp -v $HOME/.gitconfig $HOME/gitconfig.bak

echo 'Updating git credentials'
git config --global user.name $username
git config --global user.email $email

echo '-- done'

exit 0
