#!/bin/bash

brew update && brew install git mercurial go
[[ ! -d $HOME/go ]] && mkdir -pv $HOME/go

echo 'Installation done.\nRemember to update your $GOPATH :'
echo '\texport GOPATH=$HOME/go'
echo '\nBonus points:\n\tgo get code.google.com/p/go-tour/gotour\n\tgotour'

exit 0
