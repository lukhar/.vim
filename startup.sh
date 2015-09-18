#!/bin/sh

git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?

if [ ! $GIT_IS_AVAILABLE -eq 0 ]; then
    echo "You need to install git first!\n"
    return -1
fi

if [ ! -d bundle ]; then
    mkdir bundle
fi

if [ ! -d swp ]; then
    mkdir swp
fi

git clone git://github.com/Shougo/neobundle.vim bundle/neobundle.vim
