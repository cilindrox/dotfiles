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
setopt COMPLETE_IN_WORD       # complete from the cursor onwards.
setopt EXTENDED_GLOB          # expand globbing.
setopt INC_APPEND_HISTORY_TIME # uses EXTENDED_HISTORY format to write after the command is finished. Incompatible with SHARE_HISTORY
setopt HIST_ALLOW_CLOBBER     # use history entries to enable clobbering.
setopt HIST_FIND_NO_DUPS      # do not display duplicates of a found line.
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates.
setopt HIST_IGNORE_SPACE      # ignore lines which start with space.
setopt HIST_NO_FUNCTIONS      # skip function definitions.
setopt HIST_REDUCE_BLANKS     # trim extra blanks from history lines.
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

# builtin functions
autoload -Uz \
  edit-command-line \
  zcalc \
  zmv \
  url-quote-magic \
  up-line-or-beginning-search \
  down-line-or-beginning-search

zle -N edit-command-line
zle -N self-insert url-quote-magic
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybinds. Default to Emacs, even if EDITOR is set to vi
bindkey -e
bindkey '^U' backward-kill-line
bindkey '^Q' push-line-or-edit
bindkey '^Z' undo
bindkey ' ' magic-space
bindkey '^X^E' edit-command-line

autoload -Uz select-word-style
select-word-style bash

# CTRL + back/forward word navigation
bindkey ';5C' forward-word
bindkey ';3C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;3C' forward-word
bindkey ';5D' backward-word
bindkey ';3D' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;3D' backward-word

bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# Load the prompt.
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_foot_jump_prompt() { print -Pn "\e]133;A\e\\" }
precmd_functions+=( precmd_vcs_info precmd_foot_jump_prompt )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

PROMPT='%F{blue}%(5~|%-1~/.../%3~|%~)%f %F{yellow}${vcs_info_msg_0_}%f$prompt_newline%# '
RPROMPT=%B%F{red}%0(?..%?)%b%f
# Show user@machine on remote hosts
if [[ $SSH_CLIENT ]]; then
  PROMPT='%F{10}%B%n@%m%b%f %F{blue}%(5~|%-1~/.../%3~|%~)%f %# '
fi

# Load and initialize the modern completion system.
# Call compinit cache once, daily.
autoload -Uz compinit bashcompinit
() {
  local comp_file="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -f "$comp_file" && -n "$comp_file"(#qN.m-1) ]]; then
    compinit -C
  else
    compinit
  fi
  bashcompinit
}

# Completers
zstyle ':completion:*' completer _expand_alias _complete _ignored _approximate

# Matchers and Menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long

# Cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Formatting and Grouping

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description 'specify: %d'

zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches for: %d --%f'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches. Hit TAB for more, or the character to insert%s'

# One error for every three characters
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) numeric )'

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
zstyle ':completion:*:-command-:*' ignore-parents parent pwd

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,state,cputime,ucomm'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

[[ -s ~/.aliases ]] && source ~/.aliases

source $HOMEBREW_PREFIX/etc/profile.d/z.sh

autoload -Uz change-extension cs extract mcd replace kx kn tat tma tmk
