# Ruby config -- add rbenv and ruby-build to $PATH
#
# Hack for compatibility with El Capitan:
#   https://github.com/Homebrew/homebrew/issues/44997
#
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init - zsh)"
