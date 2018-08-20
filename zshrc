HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Shell settings
setopt EXTENDED_HISTORY       # save timestamp and duration.
setopt HIST_IGNORE_SPACE      # ignore lines which start with space.
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates.
setopt HIST_FIND_NO_DUPS      # do not display duplicates of a found line.
setopt HIST_IGNORE_DUPS       # do not record an event that was just recorded again.
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history.
setopt HIST_REDUCE_BLANKS     # trim extra blanks from history lines.
setopt HIST_SAVE_NO_DUPS      # do not write a duplicate event to the history file.
setopt INC_APPEND_HISTORY     # incremental append, do not wait until shell exits.
setopt SHARE_HISTORY          # share history between zsh processes.
setopt HIST_NO_FUNCTIONS      # skip function definitions.

setopt AUTOCD                 # cd just by typing the name of a directory.
setopt AUTOPUSHD              # flip between two places easily.
setopt PUSHD_IGNORE_DUPS      # do not push multiple copies of the same dir onto the stack.
setopt PUSHD_SILENT           # do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME          # pushd with no arguments gets you to Kansas.
setopt PUSHD_MINUS            # swaps `+` and `-` when used w/a number to specify a dir in the stack.
setopt NO_CLOBBER             # avoid overwriting files. Use ! to confirm.
setopt HIST_ALLOW_CLOBBER     # use history entries to enable clobbering.
setopt INTERACTIVE_COMMENTS   # allow inline comments.
setopt COMPLETE_IN_WORD       # complete from the cursor onwards.
setopt ALWAYS_TO_END          # move cursor after the word with each completion.
setopt BEEP                   # beep when no results are available.
setopt EXTENDED_GLOB          # expand globbing.
setopt COMPLETE_ALIASES       # autocompletion for alias switches.
setopt NO_FLOW_CONTROL        # disable Ctrl + q / Ctrl + s flow control. Similar to `stty -ixon`.
setopt PROMPT_SUBST           # command substitution, parameter and arithmetic expansion.
unsetopt MENU_COMPLETE        # insert the first match immediately.
setopt AUTO_MENU              # show menu for completion. Disable MENU_COMPLETE.
setopt MAGIC_EQUAL_SUBST      # enable completion after equals sign on `var=value` patterns.
unsetopt LIST_BEEP            # disable beeping on ambiguous-completion.
setopt PATH_DIRS              # perform path search even on command names with slashes.
setopt AUTO_LIST              # automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH       # add a trailing slash for completed directories.
setopt AUTO_PARAM_KEYS        # attempt to autocomplete params on lists.
setopt AUTO_REMOVE_SLASH      # remove the slash if the next character is delimiter.
setopt RCQUOTES               # double-single quotes '' for escaping

# Show elapsed time if a command takes longer than 10s
REPORTTIME=10

# Amount of directories to remember
DIRSTACKSIZE=5

# load builtin functions
autoload -Uz zcalc zmv url-quote-magic
zle -N self-insert url-quote-magic

# Keybinds. Default to Emacs, even if EDITOR is set to vi
bindkey -e
bindkey '^Q' push-line-or-edit
bindkey '^Z' undo
bindkey ' ' magic-space

autoload -U select-word-style
select-word-style bash
# CTRL + back/forward word navigation
bindkey ';5D' backward-word
bindkey ';5C' forward-word
# OS X variant
# bindkey '[C' forward-word
# bindkey '[D' backward-word

# Load the prompt.
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
prompt pure

# Helper functions.
for f in /usr/local/share/zsh/site-functions/*.zsh; do source $f; done

# Load and initialize the modern completion system.
autoload -Uz compinit && compinit

# Enable completion caching, auto rehash commands - http://www.zsh.org/mla/users/2011/msg00531.html
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

# Kubernetes autocompletion
(( $+commands[kubectl] )) && source <(kubectl completion zsh)
(( $+commands[helm] )) && source <(helm completion zsh)

[[ -s ~/.aliases ]] && source ~/.aliases

# EOF
