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

### Command shortcuts ###

`!!` - Execute last command in history<p>
`!abc` - Execute last command in history **beginning with** *abc*<p>
`!abc:p` - Print last command in history **beginning with** *abc*<p>
`. ~/.zshrc` - Reload your zsh configuration (assuming /home/< username>/.zshrc is the location of your zshrc file.)<p>

These were originally available at [Stefan Klumpp's Geek!mind](http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html) and are a nice reminder of how to get things done quicker.