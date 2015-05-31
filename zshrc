# Config options
# ** History **
setopt EXTENDED_HISTORY       # save timestamp and duration.
setopt HIST_VERIFY            # make a newline show the change before executing it.
setopt HIST_IGNORE_SPACE      # ignore lines which start with space.
setopt HIST_IGNORE_ALL_DUPS   # ignore duplicates.
setopt HIST_FIND_NO_DUPS      # do not display duplicates of a found line.
setopt HIST_REDUCE_BLANKS     # trim extra blanks from history lines.
setopt INC_APPEND_HISTORY     # incremental append, don't wait until shell exit.
setopt SHARE_HISTORY          # share history between zsh processes.
setopt HIST_NO_FUNCTIONS      # skip function definitions.
# ** Shell behavior **
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
# setopt NOMATCH              # print an error when a pattern has no matches (default behavior).
setopt CSH_NULL_GLOB          # error message when pattern fails. Null glob otherwise.
setopt EXTENDED_GLOB          # expand globbing.
# setopt GLOB_COMPLETE          # cycle through glob expansion results.
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

# Store Homebrew location...
brew_dir=$(brew --prefix)

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

# Type some chars, use the UP-DOWN keys to filter history
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\e[B' history-beginning-search-forward
# Alternate bindings for `history-substring-search` function
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ** Extra sauce **

# Alias definitions.
[[ -s ~/.aliases.zsh ]] && source ~/.aliases.zsh

# Load the prompt.
[[ -s ~/.prompt.zsh ]] && source ~/.prompt.zsh

# Completions config.
[[ -s ~/.completion.zsh ]] && source ~/.completion.zsh

# Zump around
[[ -d $brew_dir/etc/profile.d ]] && source $brew_dir/etc/profile.d/z.sh

# Helper functions.
if [ -d ~/.zsh/functions ]; then
  for function in ~/.zsh/functions/*; do
    source $function
  done
fi

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

$(boot2docker shellinit 2> /dev/null)

# EOF
