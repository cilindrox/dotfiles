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

# Global Aliases
alias -g M='| most'
alias -g NUL="> /dev/null 2>&1"
alias -g S='| sort -n'
alias -g TL='| tail -f'
alias -g lines='| wc -l'
alias -g AG='| ag'

# pretty-print JSON strings
alias -g PJ='| python -mjson.tool'
alias -g JQ='| jq .'

# Double Rainbows!
[[ -f ~/.dircolors ]] && . ~/.dircolors || eval "$(gdircolors -b)"

# Sprinkle some color...
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='gls --color=auto'
alias diff=colordiff

alias la='ls -A'
alias lf='ls -AF'
alias ll='ls -lh'
alias lla='ll -A'
alias lls='ll -S'

alias ..='cd ..'
alias ...='cd ../..'
alias dv='dirs -v'
alias tag='ctags -R -f .git/tags'
alias rand='echo $RANDOM'
alias mkd='mkdir -pv'
alias ag='ag --smart-case'
alias ags='ag --stats'

alias today='cal | grep -E --color "\b$(date +%e)\b|$"'
alias gits='git status -sb'
alias gemupd='gem update --system && gem update && gem cleanup'

alias more=most
alias lol=lolcat

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Disk usage by user, recursive implementation
#   http://serverfault.com/a/43298
# On Ubuntu, replace 'gdu' with 'du'
alias du='gdu --max-depth=1 -h'

# Copy using rsync with the following options:
#   @see: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/cp/cp.plugin.zsh
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
#  -- - everything after this is an argument, even if it looks like an option
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'

# File renaming with zmv function. Remember to add `autoload zmv` to your .zshrc
# Usage:
#   mmv *.c.orig orig/*.c
# If you decide to ditch the 'noglob', remember to quote the parameters.
alias mmv='noglob zmv -vW'

# housekeeping for homebrew
alias upd='brew update && brew upgrade --all && brew cleanup && brew prune'

# Start mongoDB using a local DB path
alias mond='mongod --dbpath "$(pwd)/data"&'

# show all git branches
alias branches='git branch -a'

# update all vim plugins
alias vimupd='cd ~vim && gitall'

alias dh='dirs -v'

alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

alias vssh='vagrant ssh'
alias vhalt='vagrant halt'
alias vup='vagrant up'

alias b2d='$(boot2docker shellinit)'

#EOF
