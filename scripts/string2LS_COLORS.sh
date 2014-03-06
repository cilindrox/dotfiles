#!/bin/bash


# basic help, should contain basic options
# should also contain short description of what it does, also referred to as 'the abstract'
if [ "$1" = '--help' ]; then
   echo "string2LS_COLORS.sh [OPTION]
Filter. Takes stdin, expected to be human legible LS_COLORS spec.

   --help      this message
   --help-all  verbose, with examples
   --reverse   input is LS_COLORS string, deconstruct and print"
   exit 1
fi

# longer help
if [ "$1" = '--help-all' ]; then
   echo "string2LS_COLORS.sh [OPTION]
Filter. Takes stdin, expected to be human legible LS_COLORS spec.

   --help      this message
   --help-all  verbose, with examples

EXAMPLE INPUT:

   $ cat /tmp/test1

   # MOVIE
   *.avi    96
   *.wmv    96
   *.mpeg   96
   *.mpg    96
   *.mov    96
   *.AVI    96
   *.WMV    96
   *.mkv    96

   # images & pdf
   *.jpg    96
   *.jpeg   96
   *.png    96
   *.xcf    96
   *.JPG    96
   *.gif    96
   *.svg    96
   *.eps 00 96
   *.pdf 00 96
   *.PDF 00 96
   *.ps  00 96


EXAMPLE OUTPUT:

   $ cat /tmp/test1 | string2LS_COLORS.sh
   *.avi=96:*.wmv=96:*.mpeg=96:*.mpg=96:*.mov=96:*.AVI=96:*.WMV=96:*.mkv=96:*.jpg=96:*.jpeg=96:*.png=96:*.xcf=96:*.JPG=96:*.gif=96:*.svg=96:*.eps=00;96:*.pdf=00;96:*.PDF=00;96:*.ps=00;96:

GENERAL COLOR CODES on GNU bash:

   0      default colour
   1      bold
   4      underlined
   5      flashing text
   6      no change
   7      reverse field
   8      black
   9      strikethrough (cool!)
   10-29  no change
   30     light green
   31     red
   32     green
   33     orange
   34     blue
   35     purple
   36     cyan
   37     grey
   38     underline
   39     no change
   40     black background
   41     red background
   42     green background
   43     orange background
   44     blue background
   45     purple background
   46     cyan background
   47     grey background
   90     dark grey
   91     light red
   92     light green
   93     yellow
   94     light blue
   95     light purple
   96     turquoise
   100    dark grey background
   101    light red background
   102    light green background
   103    yellow background
   104    light blue background
   105    light purple background
   106    turquoise background


AUTHOR
   Original script by Leo Charre, leocharre at cpan dot org

SEE ALSO
   http://leocharre.com/articles/setting-ls_colors-colors-of-directory-listings-in-bash-terminal/
   http://linux-sxs.org/housekeeping/lscolors.html"
   exit 1
fi

if [ "$1" = '--reverse' ]; then
   sed 's/:/\n/g' | sed 's/=/\t\t/g' | sed 's/;/ /g'
   exit 0
fi

# regular procedure..
grep '\w' | grep -v '^#' | sed 's/#.\+//' | perl -lane 'printf "%s=%s:", shift @F, join ";", @F;'
