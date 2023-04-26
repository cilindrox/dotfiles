# dotfiles

*It's dangerous out there!* here are some scripts to help you on your shell adventures.

**This repo** is a collection of personal preferences and configuration settings
I've gathered and tweaked from around the web. Use them wisely and share.

## Installation

This requires [Homebrew][brew] and [Homebrew Bundle][bundle] in OS X. Use the
following to install all deps:

```bash
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew bundle
```

### Helper functions

Util scripts and helper functions are linked under the
`$BREW_PATH/share/zsh/site-functions` folder.

These include the [syntax-highlighting] and [zsh-completions] plugins and `z` so
you can [zump around][z].

Prompt defaults to [pure], and completion functions are linked under the
`$BREW_PATH/share/zsh/vendor-completions` folder.

All these helper functions should be included on your current `$fpath`.

> **NOTE**: If completions aren't working for some reason, you might want to try
> rebuilding the cache:

```bash
rm -f ~/.zcompdump; compinit
```

```bash
export BREW_PATH=$(brew --prefix)

ln -s "$HOME/github/zsh-history-substring-search/zsh-history-substring-search.zsh" $BREW_PATH/share/zsh/site-functions
ln -s "$HOME/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" $BREW_PATH/share/zsh/site-functions
ln -s "$HOME/github/z/z.sh" $BREW_PATH/share/zsh/site-functions/z.zsh

ln -s "$HOME/github/zsh-completions/src" $BREW_PATH/share/zsh/vendor-completions

ln -s "$HOME/github/google-cloud-sdk/completion.zsh.inc" $BREW_PATH/share/zsh/site-functions/completion.zsh
ln -s "$HOME/github/google-cloud-sdk/path.zsh.inc" $BREW_PATH/share/zsh/site-functions/path.zsh

ln -s "$PWD/pure.zsh" $BREW_PATH/share/zsh/site-functions/prompt_pure_setup
ln -s "$PWD/async.zsh" $BREW_PATH/share/zsh/site-functions/async
```

## Misc

Disable analytics, link autocompletions by default:

```bash
brew analytics off && \
brew completions link
```

Install public keys on host:

```bash
curl -sSL https://github.com/${USERNAME}.keys -o ~/.ssh/authorized_keys
```

### Console shortcuts

Some of these were originally available on [Stefan Klumpp's Geek!mind][geekmind]
and are a nice reminder of how to get things done quicker.

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

## Load order

.zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login] → [.zlogout sometimes]

`zshenv` is the entrypoint and always sourced.

`zprofile` is meant as an alternative to .zlogin; the two are not intended to be
used together. Loads before zshrc instead of after and hands things off to
`zshrc`.

### Command shortcuts

Expression   | Description                                              |
---          | ---                                                      |
`!!`         | Execute last command in history                          |
`!*`         | Access last command's params eg: vim !*                  |
`!^`         | Access last command's first param                        |
`!$`         | Access last command's last param                         |
`!?abc?:*`   | Params of last `abc` command                             |
`!abc`       | Execute last command in history **beginning with** *abc* |
`!abc:p`     | Print last command in history **beginning with** *abc*   |
`. ~/.zshrc` | Reload your zsh configuration                            |

[bundle]: https://github.com/Homebrew/homebrew-bundle
[brew]: http://brew.sh
[syntax-highlighting]: https://github.com/zsh-users/zsh-syntax-highlighting
[z]: https://github.com/rupa/z
[pure]: https://github.com/sindresorhus/pure
[zsh-completions]: https://github.com/zsh-users/zsh-completions
[geekmind]: http://www.geekmind.net/2011/01/shortcuts-to-improve-your-bash-zsh.html
