# dotfiles

*It's dangerous out there!* here are some scripts to help you on your shell adventures.

**This repo** is a collection of personal preferences and configuration settings 
I've gathered and tweaked from around the web. Use them wisely and share.

## Installation

This requires [Homebrew][brew] and [Homebrew Bundle][bundle] in OS X. 
To install, simply call `brew bundle`.

### Helper functions

Util scripts and helper functions are linked under the 
`/usr/local/share/zsh/site-functions` folder.

These include the [syntax-highlighting] and [zsh-completions] plugins and `z` so
you can [zump around][z].

Prompt defaults to [pure], and completion functions are linked under the
`/usr/local/share/zsh/vendor-completions` folder.

All these helper functions should be included on your current `$fpath`.

> **NOTE**: If completions aren't working for some reason, you might want to try 
> rebuilding the cache:

```bash
rm -f ~/.zcompdump; compinit
```

```bash
ln -s "$HOME/github/zsh-history-substring-search/zsh-history-substring-search.zsh" /usr/local/share/zsh/site-functions
ln -s "$HOME/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" /usr/local/share/zsh/site-functions
ln -s "$HOME/github/z/z.sh" /usr/local/share/zsh/site-functions/z.zsh

ln -s "$HOME/github/zsh-completions/src" /usr/local/share/zsh/vendor-completions

ln -s "$HOME/github/google-cloud-sdk/completion.zsh.inc" /usr/local/share/zsh/site-functions/completion.zsh
ln -s "$HOME/github/google-cloud-sdk/path.zsh.inc" /usr/local/share/zsh/site-functions/path.zsh

ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async
```

## Misc

Some of these were originally available on [Stefan Klumpp's Geek!mind][geekmind]
and are a nice reminder of how to get things done quicker.

### Console shortcuts

`Ctrl+A` - Move to the **beginning** of the line<p>
`Ctrl+E` - Move to the **end** of the line<p>
`Alt+B` - Move one word **backward**<p>
`ALT+F` - Move one word **forward**<p>
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

See the `bindkey` builtin for a more extensive list.

### Command shortcuts

`!!` - Execute last command in history<p>
`!abc` - Execute last command in history **beginning with** *abc*<p>
`!abc:p` - Print last command in history **beginning with** *abc*<p>
`. ~/.zshrc` - Reload your zsh configuration (assuming /home/< username>/.zshrc is the location of your zshrc file.)<p>

[bundle]: https://github.com/Homebrew/homebrew-bundle
[brew]: http://brew.sh
[syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[z]: https://github.com/rupa/z
[pure]: https://github.com/sindresorhus/pure
[zsh-completions]: https://github.com/zsh-users/zsh-completions
[geekmind]: http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html
