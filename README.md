dotFiles
=========

**This repo** is a collection of personal preferences and configuration settings I've tweaked and gathered from around the web. Use them wisely and share the shit out of this. Seriously.

## Installation

**STILL BETA**. See [TODO](#todo)

Just run:

    sh install.sh

and let the installation script work its magic.

## Homebrew

Most of this couldn't be possible, at least not on OS X, without *Homebrew*. In order to install it on your system, just run

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

Refer to the [official documentation][1] for more info.

### Gotchas

Things to keep in the mind of the hacker...

#### Updating Formulae and Cellar

To keep everything running as smooth as possible, remember to run this periodically:

    brew update && brew upgrade

If something seems to have gone fubar, just call the doctor:

    brew doctor

#### Keeping track of your Cellar

Call `brew list` to get a (wait for it) list of all your installed packages. This can come in handy in order to keep and up-to-date backup reference, like so:

    brew list > path/to/my/Dropbox/brew.packages

I'll add a script to reinstall from that list at a later time.

#### Linking formulae

On OSX, after installing `curl` you'll need to create the corresponding symlinks in order to replace Apple's bundled version. This is a simple matter of:

    brew link curl --force

**DO NOT DO THIS WITH RUBY** the correct (and safest) approach is to use either [rbenv][2] or [rvm][3].

## Bits and pieces

More documentation and dependencies laying around this repo:

* [Z-Shell configuration][4]
* [Sublime configuration][5]
* [gitignore][6]


## TODO
- Add param parsing options to install script
- Add backup to dotfile linking functions

[1]: http://brew.sh
[2]: https://github.com/sstephenson/rbenv
[3]: https://rvm.io
[4]: zsh/README.md
[5]: sublime/README.md
[6]: https://github.com/gfestari/gitignore
