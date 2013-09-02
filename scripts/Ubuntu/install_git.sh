#!/bin/bash

# This script adds the git-core ppa and
# installs the latest version of git available.

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.

# Installation requires root privileges, duh.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

sudo add-apt-repository ppa:git-core/ppa

wait

sudo apt-get update && sudo apt-get install git gitk

exit 0
