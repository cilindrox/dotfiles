# Z-Shell

Just some quick tips to kickstart your shell.

## Linking homebrew

On OS X, add homebrew completion by running this on your terminal:

    mkdir -p ~/.zsh/func
    ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" ~/.zsh/func/_brew

Add the following to your ~/.zshrc:

    fpath=($HOME/.zsh/func $fpath)
    typeset -U fpath


## Fixing PATH errors

Edit your `/etc/paths` and put `/usr/local/bin` on top of `/usr/bin`

    % sudo vi /etc/paths

    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /bin
    /usr/sbin
    /sbin

More info: [amend PATH homebrew](http://stackoverflow.com/questions/10343834/homebrew-wants-me-to-amend-my-path-no-clue-how)


## Completion
All functions within the `completion` folder should be on your current `$FPATH` after that, you could (optionally) call `rm ~/.zcompdump` to clear zsh's completion cache.

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


## Console shortcuts

*It's dangerous out there!* here are some shortcuts to get you going on your zsh adventure:<p>

`Ctrl+A` - Move to the **beginning** of the line<p>
`Ctrl+E` - Move to the **end** of the line<p>
`Ctrl+Left arrow` | `Alt+B`- Move one word **backward**<p>
`Ctrl+Right arrow` | `ALT+F` - Move one word **forward**<p>
`Ctrl+U` - **Clear** the **entire line**<p>
`Ctrl+K` - **Clear** the characters on the line **after the current cursor position**<p>
`Ctrl+W` | `Ctrl+Backspace` - **Delete** the word **in front of the cursor**<p>
`Alt+D` - **Delete** the word **after** the cursor<p>
`Ctrl+R` - **Search history** (press again to find *next* match, pressing `Right arrow` allows you to edit current selected value)<p>
`Ctrl+S` - **Forward-search history** Useful for those times when you went *one `Ctrl+R` too far*. Remember to issue a `stty -ixon` on your `.bashrc` or `.zshrc` configuration to unbind XON/XOFF occurrences<p>
`Ctrl+G` - **Quit** *search mode*<p>
`Ctrl+_` - **Undo last change**<p>
`Ctrl+L` - **Clear** screen<p>
`Ctrl+S` - **Stop** output to screen<p>
`Ctrl+Q` - **Re-enable** screen output<p>
`Ctrl+C` - **Terminate/kill** current foreground process<p>
`Ctrl+Z` - **Suspend/stop** current foreground process<p>

### Command shortcuts

`!!` - Execute last command in history<p>
`!abc` - Execute last command in history **beginning with** *abc*<p>
`!abc:p` - Print last command in history **beginning with** *abc*<p>
`. ~/.zshrc` - Reload your zsh configuration (assuming /home/< username>/.zshrc is the location of your zshrc file.)<p>

These were originally available at [Stefan Klumpp's Geek!mind](http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html) and are a nice reminder of how to get things done quicker.

## Noteworthy manpages

Just a list of handy manpages to keep as a reference.

* ascii(7)
* chmod(1)
* fstab(5)
* hier(7)
* locale(1P)(5)(7)
* printf(3)
* proc(5)
* regex(7)
* signal(7)
* term(5)(7)
* termcap(5)
* terminfo(5)

Source: [Arch Wiki][1]

[1]: https://wiki.archlinux.org/index.php/Man_Page#Noteworthy_manpages
