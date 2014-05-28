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

# git gutter
git clone git://github.com/airblade/vim-gitgutter.git

# airline && powerline fonts:
# https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
git clone git://github.com/bling/vim-airline.git
git clone git://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts
echo 'NOTE: change non-ASCII font to a prepatched one to get powerline working.'

exit 0
