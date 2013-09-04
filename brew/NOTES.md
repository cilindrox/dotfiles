# Homebrew

## Installation

On a fresh system just run

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

Refer to the [official documentation](http://brew.sh) for more info.

## Updating Formulae and Cellar

In order to keep everything running as smooth as possible, just remember to run this periodically:

    brew update && brew upgrade

If something seems to have gone fubar, just call the doctor:

    brew doctor

## Keeping track of your Cellar

Call `brew list` to get a (wait for it) list of all your installed packages. This can come in handy in order to keep and up-to-date backup reference, like so:

    brew list > path/to/my/Dropbox/brew.packages

I'll add a script to reinstall from that list at a later time.

## Gotchas

On OSX, after installing `curl` you'll need to create the corresponding symlinks in order to replace Apple's bundled version. This is a simple matter of:

    brew link curl --force

**DO NOT DO THIS WITH RUBY** the correct (and safest) approach is to use either [rbenv](https://github.com/sstephenson/rbenv) or [rvm](https://rvm.io).
