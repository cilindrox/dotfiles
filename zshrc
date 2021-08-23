HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
REPORTTIME=10  # Show elapsed time if a command takes longer than 10s
DIRSTACKSIZE=5 # Amount of directories to remember

# Shell settings
setopt ALWAYS_TO_END          # move cursor after the word with each completion.
setopt AUTOCD                 # cd just by typing the name of a directory.
setopt AUTOPUSHD              # flip between two places easily.
setopt AUTO_LIST              # automatically list choices on ambiguous completion.
setopt AUTO_MENU              # show menu for completion. Disables MENU_COMPLETE.
setopt AUTO_PARAM_KEYS        # attempt to autocomplete params on lists.
setopt AUTO_PARAM_SLASH       # add a trailing slash for completed directories.
setopt AUTO_REMOVE_SLASH      # remove the slash if the next character is delimiter.
setopt COMPLETE_ALIASES       # autocompletion for alias switches.
setopt COMPLETE_IN_WORD       # complete from the cursor onwards.
setopt EXTENDED_GLOB          # expand globbing.
setopt HIST_ALLOW_CLOBBER     # use history entries to enable clobbering.
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS      # do not display duplicates of a found line.
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates.
setopt HIST_IGNORE_DUPS       # do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE      # ignore lines which start with space.
setopt HIST_NO_FUNCTIONS      # skip function definitions.
setopt HIST_REDUCE_BLANKS     # trim extra blanks from history lines.
setopt HIST_SAVE_NO_DUPS      # do not write a duplicate event to the history file.
setopt INTERACTIVE_COMMENTS   # allow inline comments.
setopt MAGIC_EQUAL_SUBST      # enable completion after equals sign on `var=value` patterns.
setopt NO_BEEP                # beep when no results are available.
setopt NO_CLOBBER             # avoid overwriting files. Use ! to confirm.
setopt NO_FLOW_CONTROL        # disable Ctrl + q / Ctrl + s flow control. Similar to `stty -ixon`.
setopt NO_LIST_BEEP           # disable beeping on ambiguous-completion.
setopt PATH_DIRS              # perform path search even on command names with slashes.
setopt PROMPT_SUBST           # command substitution, parameter and arithmetic expansion.
setopt PUSHD_IGNORE_DUPS      # do not push multiple copies of the same dir onto the stack.
setopt PUSHD_MINUS            # swaps `+` and `-` when used w/a number to specify a dir in the stack.
setopt PUSHD_SILENT           # do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME          # pushd with no arguments gets you to Kansas.
setopt RCQUOTES               # double-single quotes '' for escaping
setopt SHARE_HISTORY          # share history between zsh processes.

# setopt INC_APPEND_HISTORY_TIME # uses EXTENDED_HISTORY format to write after the command is finished. Incompatible with SHARE_HISTORY

# builtin functions
autoload -Uz zcalc zmv url-quote-magic up-line-or-beginning-search down-line-or-beginning-search
zle -N self-insert url-quote-magic
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybinds. Default to Emacs, even if EDITOR is set to vi
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
bindkey '^Z' undo
bindkey ' ' magic-space

autoload -Uz select-word-style
select-word-style bash

# CTRL + back/forward word navigation
bindkey ';5C' forward-word
bindkey ';5D' backward-word
bindkey ';3C' forward-word
bindkey ';3D' backward-word

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Load the prompt.
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
prompt pure

# Load and initialize the modern completion system.
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

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

[[ -s ~/.aliases ]] && source ~/.aliases

source $HOMEBREW_PREFIX/etc/profile.d/z.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh" --no-use

# terraform
complete -o nospace -C $HOMEBREW_PREFIX/bin/terraform terraform
