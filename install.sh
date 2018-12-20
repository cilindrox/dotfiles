#!/usr/bin/env bash

set -euo pipefail

brew bundle

echo 'Linking settings...'

for f in 'tmux.conf' 'aliases' 'editorconfig' 'zshenv' 'zshrc' 'gitconfig' 'gemrc' 'gitignore' 'agignore' 'npmrc' 'zlogout' 'ssh' 'gnupg' 'dircolors'; do
  ln -sf "$PWD/${f}" "${HOME}/.${f}"
done

echo 'All done. Happy coding!'
