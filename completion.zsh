# Misc completion
[[ -d /usr/local/share/zsh/site-functions ]] && \
  fpath=(/usr/local/share/zsh/site-functions $fpath)

# zsh completions (github.com/zsh-users/zsh-completions)
[[ -d /usr/local/share/zsh-completions ]] && \
  fpath=(/usr/local/share/zsh-completions $fpath)

# You might need to rebuild zcompdump:
#   rm -f ~/.zcompdump; compinit

typeset -U fpath

# Load and initialize the modern completion system.
autoload -Uz compinit && compinit

# zsh syntax highlightning:
#   https://github.com/zsh-users/zsh-syntax-highlighting
[[ -d /usr/local/share/zsh-syntax-highlighting ]] && \
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history substring search
#   Called after syntax-highlightning so we can use both
[[ -d /usr/local/opt/zsh-history-substring-search ]] && \
  source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# Enable completion caching, auto rehash commands -- http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' rehash true

# Case-insensitive, partial-word, then substring completion.
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=* l:|=*' 'm:{a-zA-Z}={A-Za-z}'

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
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,state,cputime,ucomm'

# Enable node completion
eval "$(npm completion 2>/dev/null)"

