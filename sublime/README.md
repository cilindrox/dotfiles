# Sublime Text 3 preferences

See [this link][1] for more info on how to set up sync for Package Control preferences and Sublime settings.

## Adding a command line utility for SublimeText

Use this to enable the `subl` utility to work with files and projects on the command line or as an EDITOR for unix tools such as git.

### OS X Command Line

**NOTE** This [assumes](http://olivierlacan.com/posts/launch-sublime-text-3-from-the-command-line/) Sublime Text is placed in 'Applications'

    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

## Setting Sublime as the default EDITOR

    export EDITOR='subl -w'

The `-w` flag will make `subl` wait for the file to be closed before exiting.

### Options

**NOTE** these are all accessible via `subl --help`

    Usage: subl [arguments] [files]         edit the given files
       or: subl [arguments] [directories]   open the given directories
       or: subl [arguments] -               edit stdin

    Arguments:
      --project <project>: Load the given project
      --command <command>: Run the given command
      -n or --new-window:  Open a new window
      -a or --add:         Add folders to the current window
      -w or --wait:        Wait for the files to be closed before returning
      -b or --background:  Don't activate the application
      -s or --stay:        Keep the application activated after closing the file
      -h or --help:        Show help (this message) and exit
      -v or --version:     Show version and exit

    --wait is implied if reading from stdin. Use --stay to not switch back
    to the terminal when a file is closed (only relevant if waiting for a file).

    Filenames may be given a :line or :line:column suffix to open at a specific
    location.

Please refer to [the official documentation](http://www.sublimetext.com/docs/3/osx_command_line.html) in case of snafu.

## Handy shortcuts

### Join lines

    Cmd + J
    Ctrl + J

### Swap lines

Because copypasta needs a break from time to time.

    Ctrl + Cmd + Up/Down
    Ctrl + Shift + Up/Down

### Cloning lines

    Ctrl + Shift + D

### Capitalize!

    Cmd + K, Cmd + U (upcase)
    Cmd + K, Cmd + L (lowcase)

    Ctrl + K, Cmd + U (upcase)
    Ctrl + K, Cmd + L (lowcase)

### Sort / Alphabetical sort

Troz!

    F5
    Cmd + F5 (Capital first)

    F9
    Ctrl + F9 (Capital first)

### Comment / Block comment

    Cmd + /
    Cmd + Opt +/

    Ctrl + /
    Ctrl + Shift + /

### Block wrapping

    Cmd + Opt + Q
    Alt + Q

[1]: [https://sublime.wbond.net/docs/syncing]
