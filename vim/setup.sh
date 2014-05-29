#!/usr/bin/env zsh

# .vimrc
echo 'Linking config files...'
ln -s "$(pwd)/vimrc" ~/.vimrc
ln -s "$(pwd)/vimrc.bundles" ~/.vimrc.bundles

echo 'Installing Vundle...'
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Powerline fonts for vim-airline
# echo 'Installing powerline fonts...'
# git clone git://github.com/Lokaltog/powerline-fonts.git ~/.fonts
# fc-cache -vf ~/.fonts
# echo 'NOTE: change non-ASCII font to a prepatched one to get powerline working.'

exit 0
