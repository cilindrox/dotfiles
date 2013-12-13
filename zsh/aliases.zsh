# Just some handy aliases for commands and functions

# NOTE: `dircolors` requires the coreutils package to be installed.
# Alternatively, you could use BSD's output:
#   export CLICOLOR=1
#   export LSCOLORS=exfxcxdxbxegedabagacad
#
# ..and use this instead on OS X
#   alias ls='ls -G'
#
# Otherwise, remember to replace the following on Ubuntu:
#   `gdircolors` => `dircolors`
#   `gls` => `ls`

# Double Rainbows!
[[ -f ~/.dircolors ]] && source ~/.dircolors || eval "$(gdircolors -b)"

# Sprinkle some color...
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='gls --color=auto'

alias la='ls -A'
alias lf='ls -aF'
alias ll='ls -lh'
alias lla='ll -a'
alias lls='ll -S'

alias ..='cd ..'
alias ...='cd ../..'
alias dv='dirs -v'
alias tag='ctags -R -f .tags'
alias rand='echo $RANDOM'
alias mkd='mkdir -pv'

alias gits='git status -sb'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Disk usage by user, recursive implementation
#   http://serverfault.com/a/43298
# On Ubuntu, replace 'gdu' with 'du'
alias du='gdu --max-depth=1 -h'

# Backup copy RSync
# Selected options are:
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
#  -- - everything after this is an argument, even if it looks like an option
# @see: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/cp/cp.plugin.zsh
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'

# File renaming with zmv function. Remember to add `autoload zmv` to your .zshrc
# Usage:
#   mmv *.c.orig orig/*.c
# If you decide to ditch the 'noglob', remember to quote the parameters.
alias mmv='noglob zmv -vW'

#EOF