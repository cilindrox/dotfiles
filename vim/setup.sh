#!/usr/bin/env zsh

# .vimrc
echo 'Linking config files...'
ln -s "$(pwd)/vimrc" ~/.vimrc
ln -s "$(pwd)/vimrc.bundles" ~/.vimrc.bundles

echo 'Installing Vundle...'
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

exit 0
