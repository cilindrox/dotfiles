#!/usr/bin/env zsh


echo 'Installing pathogen...'
git clone https://github.com/tpope/vim-pathogen.git
echo 'linking files...'
ln -s $(pwd)/vim-pathogen/autoload ~/.vim/autoload
echo 'Done. Remember to initialize pathogen on your .vimrc file!'

echo 'Creating plugin struct...'
mkdir -p ~/.vim/bundle;

echo 'Installing plugins...'
cd ~/.vim/bundle

# NERDTree
git clone https://github.com/scrooloose/nerdtree.git

# CtrlP
git clone https://github.com/kien/ctrlp.vim.git

git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/tpope/vim-scriptease.git
git clone git://github.com/tpope/vim-dispatch.git
git clone git://github.com/tpope/vim-fugitive.git

# Ruby
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git

# base16
git clone https://github.com/chriskempson/base16-vim.git

exit 0
