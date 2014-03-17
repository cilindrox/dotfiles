# mix in zsh completions (https://github.com/zsh-users/zsh-completions)
# You might need to rebuild zcompdump:
#   rm -f ~/.zcompdump; compinit
[[ -d /usr/local/share/zsh-completions ]] && \
  fpath=(/usr/local/share/zsh-completions $fpath)

# Load and initialize the modern completion system.
autoload -Uz compinit && compinit

# load completion system
# zmodload -i zsh/complist

# zsh syntax highlightning:
#   https://github.com/zsh-users/zsh-syntax-highlighting
[[ -d /usr/local/share/zsh-syntax-highlighting ]] && \
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history substring search
#   Called after syntax-highlightning so we can use both
[[ -d /usr/local/opt/zsh-history-substring-search ]] && \
  source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on

# auto rehash commands -- http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion:*' rehash true

# Case-insensitive, partial-word, then substring completion.
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=* l:|=*' 'm:{a-zA-Z}={A-Za-z}'

# Menu formatting and messages
# zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' menu select=long
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description 'specify: %d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches for: %d --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches. Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-compctl false

# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions

# zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# One error for every three characters
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
# cd will ignore parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# Ubuntu:
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# OS X:
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,state,cputime,ucomm'

# autoload -Uz vcs_info # ???
# man zshcontrib
# zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:*' enable git hg

# Completion helper functions
if [ -d ~/.zsh/func ]; then
  for i in ~/.zsh/func ; do
    . $i
  done
fi

# Enable node completion
eval "$(npm completion 2>/dev/null)"
