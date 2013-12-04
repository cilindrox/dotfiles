# Put here all helper functions for your zsh

# load `zcalc` and `zmv` utilities
autoload -Uz zcalc zmv

function token () {
    # Outputs your Github token, as defined in your gitconfig
    echo `git config --global github.token`
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
    W=`pwd`
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

rand () {
# Rreturns a random number between 1..z
    # if (( $# == 0 ))
    # then echo usage: yp name ...; fi
    # $[RANDOM % $1 + 1]
    echo $RANDOM
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
      url=$url"$i""+"
    done

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

# EOF
