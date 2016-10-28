# Config options
#                     ** History **
setopt EXTENDED_HISTORY       # save timestamp and duration.
setopt HIST_VERIFY            # make a newline show the change before executing it.
setopt HIST_IGNORE_SPACE      # ignore lines which start with space.
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates.
setopt HIST_FIND_NO_DUPS      # do not display duplicates of a found line.
setopt HIST_IGNORE_DUPS       # do not record an event that was just recorded again.
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history.
setopt HIST_REDUCE_BLANKS     # trim extra blanks from history lines.
setopt HIST_SAVE_NO_DUPS      # do not write a duplicate event to the history file.
setopt INC_APPEND_HISTORY     # incremental append, don't wait until shell exits.
setopt SHARE_HISTORY          # share history between zsh processes.
setopt HIST_NO_FUNCTIONS      # skip function definitions.
#                     ** Shell behavior **
setopt AUTOCD                 # cd just by typing the name of a directory.
setopt AUTOPUSHD              # flip between two places easily.
setopt PUSHD_IGNORE_DUPS      # don't push multiple copies of the same dir onto the stack.
setopt PUSHD_SILENT           # don't print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME          # pushd with no arguments gets you to Kansas.
setopt PUSHD_MINUS            # swaps `+` and `-` when used w/a number to specify a dir in the stack.
setopt NO_CLOBBER             # avoid overwriting files. Use ! to confirm.
setopt HIST_ALLOW_CLOBBER     # use history entries to enable clobbering.
setopt INTERACTIVE_COMMENTS   # allow inline comments.
setopt COMPLETE_IN_WORD       # complete from the cursor onwards.
setopt ALWAYS_TO_END          # move cursor after the word with each completion.
setopt BEEP                   # beep when no results are available.
setopt EXTENDED_GLOB          # expand globbing.
setopt COMPLETE_ALIASES       # autocompletion for aliases' switches.
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

# Keep 10,000 lines of history within the shell and save it to ~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

# Show elapsed time if a command takes longer than 10s
REPORTTIME=10

# Amount of directories to remember
DIRSTACKSIZE=5

# load `zcalc` and `zmv` functions
autoload -Uz zcalc zmv
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Store Homebrew location...
brew_dir='/usr/local'

# Enable online help
unalias run-help
autoload -Uz run-help
HELPDIR=$brew_dir/share/zsh/helpfiles

# Keybinds. Default to Emacs, even if EDITOR is set to vi
bindkey -e
bindkey '^Q' push-line-or-edit
bindkey '^Z' undo
bindkey ' ' magic-space

autoload -U select-word-style
select-word-style bash
# CTRL + back/forward word navigation
# Use ";5D", ";5C" for other 'nixes
bindkey '[C' forward-word
bindkey '[D' backward-word

# Alias definitions.
[[ -s ~/.aliases.zsh ]] && source ~/.aliases.zsh

# Load the prompt.
autoload -Uz promptinit && promptinit # use the included prompt functionality
autoload -Uz colors && colors         # create a 'colors' associative array

prompt pure

# Completions config.
[[ -s ~/.completion.zsh ]] && source ~/.completion.zsh

# Type some chars, use the UP-DOWN keys to filter history
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/340#issuecomment-230382677
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Zump around
[[ -d $brew_dir/etc/profile.d ]] && source $brew_dir/etc/profile.d/z.sh

# Helper functions.
if [ -d ~/.functions ]; then
  for function in ~/.functions/*; do
    source $function
  done
fi

# EOF
