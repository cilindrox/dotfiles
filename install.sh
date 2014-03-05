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
brew update && brew upgrade

# # #
# Install GNU utilities and link them with their default names
# # #
brew install coreutils
brew tap homebrew/dupes
brew install binutils diffutils gawk wget
brew install findutils --default-names
brew install gnu-getopt --default-names
brew install gnu-indent --default-names
brew install gnu-tar --default-names
brew install gnu-sed --default-names
brew install gnutls --default-names
brew install grep --default-names

brew install python --with-brewed-openssl
brew install openssh --with-brewed-openssl
brew install macvim --override-system-vim --custom-system-icons
brew install vim --override-system-vi

# # #
# Update core OS X tools
# # #
brew install openssl bash emacs gpatch nano m4 make curl rsync
brew install git ctags jq most the_silver_searcher colordiff mercurial tree htop-osx
brew install z figlet gource youtube-dl jpeg ffmpeg faac lame webp x264 xvid
brew install mongodb redis
brew install go node python3
brew install rbenv ruby-build rbenv-aliases rbenv-default-gems rbenv-gem-rehash rbenv-vars
brew install zsh zsh-completions zsh-history-substring-search zsh-lovers zsh-syntax-highlighting

# link restricted formulae
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

# create a .zsh directory for our helper functions and link some of them
mkdir ~/.zsh; ln -s $repo_dir/zsh/completion/_go ~/.zsh/_go

# # #
# Sublime Text 3 preferences
# # #
ln -s $repo_dir/sublime/User "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

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
