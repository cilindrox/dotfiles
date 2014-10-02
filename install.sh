#!/bin/bash
#
# TODO - This script will (eventually) set up your new environment.
#

# # #
# Function to install homebrew [ http://brew.sh ]
# # #
install_brew() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew install ansifilter

brew install python --with-brewed-openssl
brew install openssh --with-brewed-openssl
brew install macvim --override-system-vim --custom-system-icons
brew install vim --override-system-vi

# # #
# Update core OS X tools
# # #
brew install openssl tmux bash emacs gpatch nano m4 make curl rsync
brew install git git-extras tig ctags jq most the_silver_searcher colordiff mercurial tree htop-osx
brew install z v figlet gource youtube-dl jpeg ffmpeg faac lame webp x264 xvid imagemagick ttyrec
brew install mongodb redis rethinkdb
brew install go python3
brew install leiningen
brew install rbenv ruby-build rbenv-aliases rbenv-default-gems rbenv-gem-rehash rbenv-vars

# link restricted formulae
brew link curl --force
# brew link sqlite --force

# # #
# set zsh as your login shell
# # #
brew install zsh zsh-completions zsh-history-substring-search zsh-lovers zsh-syntax-highlighting
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh $USER

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

# link git hooks
ln -s "$repo_dir/git_template" ~/.git_template

# link default-gem list
ln -s $repo_dir/prefs/default-gems ~/.rbenv/default-gems

# # #
# zsh config
# # #

mkdir ~/.zsh

# link startup files and zsh config
startup_files=( aliases.zsh funcs.zsh prompt.zsh zshrc zshenv zlogin zlogout )
for j in "${startup_files[@]}"
do
  ln -s $repo_dir/zsh/$j ~/.$j
done

# link helper and completion functions
ln -s $repo_dir/zsh/functions ~/.zsh/functions
ln -s $repo_dir/zsh/completion ~/.zsh/completion

# # #
# vimfiles
# # #
echo 'Installing Vundle and linking config files...'
ln -s $repo_dir/vim/vimrc ~/.vimrc
ln -s $repo_dir/vim/vimrc.plugins ~/.vimrc.plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo 'done.'

# tmux
ln -s $repo_dir/tmux/tmux.conf ~/.tmux.conf

# # #
# Sublime Text 3 preferences
# # #
ln -s $repo_dir/sublime/User "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# # #
# Atom editor preferences
# # #
ln -s $repo_dir/atom "$HOME/.atom"

# # #
# Misc tool configuration
# # #

# # #
# node
# # #
# npm bug has been fixed. Keeping this here just in case
# brew install node --without-npm
brew install node
# curl -L https://npmjs.org/install.sh | sh
npm install -g npm-check-updates express coffee-script nodemon coffeelint jshint gulp mocha docco ngen

# Git: update these vars to match your username and email
username='uname'
email='uname@email.com'

# backup existing .gitconfig if any
# echo 'Copying git preferences'
# [[ -f $HOME/.gitconfig ]] && cp -v $HOME/.gitconfig $HOME/gitconfig.bak

echo 'Updating git credentials'
git config --global user.name $username
git config --global user.email $email

echo '-- done'

exit 0
