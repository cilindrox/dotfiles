#!/bin/bash

# This script adds the git-core ppa and
# installs the latest version of git available.

E_NOTROOT=87   # Non-root exit error.

# Check for root permissions
if [ `whoami` != 'root' ]; then
  echo 'This script needs to be run as root.'
  exit $E_NOTROOT
fi

clear
echo 'Installing Git ...'

# This adds the most up-to-date PPA and installs git on your system.
sudo add-apt-repository --yes ppa:git-core/ppa
wait
sudo apt-get update --yes && sudo apt-get install --yes git gitk

exit 0

# EOF
