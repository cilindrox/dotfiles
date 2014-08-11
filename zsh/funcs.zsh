# Put here all helper functions for your zsh

# load `zcalc` and `zmv` functions
autoload -Uz zcalc zmv

# Outputs your Github token, as defined in your gitconfig
function token () {
    print $(git config --global github.token)
}

cs () {
# a simple function to `cd` and `ls`
    cd "$@" && ls -A
}

# Alternatively, if a default is required, it could be aliased instead to:
#   function chpwd ( ) {
#       emulate -L zsh
#       ls
#   }

gitall () {
# Recursively updates all git repositories in a directory.
# Sauce: http://blog.sdbarker.com/pro-tip-recursively-updating-all-git-repositories-in-a-directory
    W=$(pwd)
    for i in $(find . -name .git)
    do
        D=$i
        D=${D%/*}
        cd "$W/$D"
        pwd
        git pull --ff-only
    done
    cd "$W"
}

cliff_rand () {
# Outputs a random number using Cliff Random Number Generator
# See: http://mathworld.wolfram.com/CliffRandomNumberGenerator.html
# Bonus points:
#     alias cliff=cliff_rand
# TODO: add args parsing for defining ranges.
#   eg:
#       cliff_rand 10 => rand [0..10]
#       cliff_rand 10 -h => rand [1..10] # human readable
#       cliff_rand 1..4 => rand [1..4]
    zmodload zsh/mathfunc
    seed=0.1
    (( seed = 100 * log(seed) ))
    (( number = fmod(seed, 1.0) ))
    (( cliff_number = fabs(number) ))
    print $cliff_number
}

randpass () {
# Outputs a random password consisting of the chars on the `chars` array.
    zmodload -i zsh/mathfunc

    password=""
    length="$1" # Max possible value are equal to size of $chars.
    chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?:^~@#$%&*_+=[]/"

    while (( i++ < length ))
    do
      random=$((1 + int(${(c)#chars} * rand48())))
      $password+="$chars[$random]"
      chars[$random]=""
    done

    echo "$password"
}

# translates `...` into ../..
rationalize-dot () {
  [[ $LBUFFER = *.. ]] && LBUFFER+=/.. || LBUFFER+=.
}
zle -N rationalize-dot
bindkey . rationalize-dot

explain () {
# Usage:    explain COMMAND
# Opens a browser window for the COMMAND page on explainshell.com
# Sauce: https://github.com/schneems/explain_shell
    # base url with first command already injected
    # $ explain tar
    #   => http://explainshell.com/explain/tar?args=
    url="http://explainshell.com/explain/$1?args="

    # removes $1 (tar) from arguments ($@)
    shift;

    # iterates over remaining args and adds builds the rest of the url
    for i in "$@"; do
        url=$url"$i+"
    done

    url=$url[0,-2]

    # opens url in browser
    case $OSTYPE in
        darwin*)
            open $url ;;
        linux-gnu)
            xdg-open $url ;;
        cygwin)
            cygstart $url ;;
        *)
            echo "no can do"
    esac
}

# Wait 30s before closing the terminal.
# Trap the alarm and update the title bar.
# TRAPALARM () {
#     print -nP "\e]2;%T\a"
#     TMOUT=30
# }
# TMOUT=30

# colored manpages
# man () {
#     env LESS_TERMCAP_mb=$'\E[01;31m' \
#     LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#     LESS_TERMCAP_me=$'\E[0m' \
#     LESS_TERMCAP_se=$'\E[0m' \
#     LESS_TERMCAP_so=$'\E[38;5;246m' \
#     LESS_TERMCAP_ue=$'\E[0m' \
#     LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#     man "$@"
# }

# `extract` function, stolen from oh-my-zsh:
#   @see: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/extract/extract.plugin.zsh
extract () {
  local remove_archive
  local success
  local file_name
  local extract_dir

  if (( $# == 0 )); then
    echo "Usage: extract [-option] [file ...]"
    echo
    echo Options:
    echo "    -r, --remove    Remove archive."
    echo
    echo "Report bugs to <sorin.ionescu@gmail.com>."
  fi

  remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" 1>&2
      shift
      continue
    fi

    success=0
    file_name="$( basename "$1" )"
    extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
    case "$1" in
      (*.tar.gz|*.tgz) tar xvzf "$1" ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
      (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
        && tar --xz -xvf "$1" \
        || xzcat "$1" | tar xvf - ;;
      (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
        && tar --lzma -xvf "$1" \
        || lzcat "$1" | tar xvf - ;;
      (*.tar) tar xvf "$1" ;;
      (*.gz) gunzip "$1" ;;
      (*.bz2) bunzip2 "$1" ;;
      (*.xz) unxz "$1" ;;
      (*.lzma) unlzma "$1" ;;
      (*.Z) uncompress "$1" ;;
      (*.zip|*.war|*.jar) unzip "$1" -d $extract_dir ;;
      (*.rar) unrar x -ad "$1" ;;
      (*.7z) 7za x "$1" ;;
      (*.deb)
        mkdir -p "$extract_dir/control"
        mkdir -p "$extract_dir/data"
        cd "$extract_dir"; ar vx "../${1}" > /dev/null
        cd control; tar xzvf ../control.tar.gz
        cd ../data; tar xzvf ../data.tar.gz
        cd ..; rm *.tar.gz debian-binary
        cd ..
      ;;
      (*)
        echo "extract: '$1' cannot be extracted" 1>&2
        success=1
      ;;
    esac

    (( success = $success > 0 ? $success : $? ))
    (( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
    shift
  done
}

alias x=extract

# Retrieve version info from an npm package
npm_info () {
  npm info $1 version
}

# Displays a list of available branches and last committer, sorted by date.
# protip: alias this as `git hist`
repo_history () {
  git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n
}

# List all globally-installed npm packages
npm_global_instals () {
  npm ls -gp --depth=0 | awk -F/node_modules/ '{print $2}' | grep -vE '^(npm|)$'
  # | xargs npm -g rm
}

# Attach or create tmux session named the same as current directory.
tat () {
  tmux new-session -As "$(basename "$PWD" | tr . -)"
}

# EOF
