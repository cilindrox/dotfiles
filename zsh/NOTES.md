### ZSH _functions
All zsh functions should be copied to your current loaded `$FPATH`. Optionally, `rm ~/.zcompdump` to clear zsh's completion cache.

On OS X, using homebrew you should have something like:

    /usr/local/Cellar/zsh/<zsh.version>/share/zsh/functions/

Or use `locate _find` to track down your current installation.

### LS_COLORS

Here's the list of available color combinations under GNU `ls` command. Just remember to alias an `--color=auto` option when it's called.

    0   = default colour
    1   = bold
    4   = underlined
    5   = flashing text
    7   = reverse field
    31  = red
    32  = green
    33  = orange
    34  = blue
    35  = purple
    36  = cyan
    37  = grey
    40  = black background
    41  = red background
    42  = green background
    43  = orange background
    44  = blue background
    45  = purple background
    46  = cyan background
    47  = grey background
    90  = dark grey
    91  = light red
    92  = light green
    93  = yellow
    94  = light blue
    95  = light purple
    96  = turquoise
    100 = dark grey background
    101 = light red background
    102 = light green background
    103 = yellow background
    104 = light blue background
    105 = light purple background
    106 = turquoise background

   For more info, please refer to [this post](http://linux-sxs.org/housekeeping/lscolors.html).
