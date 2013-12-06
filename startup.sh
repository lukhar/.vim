#!/bin/sh

git --version 2>&1 >/dev/null 
GIT_IS_AVAILABLE=$?

if [ -d bundle ]; then
    echo "It appears you already have a bundle, before proceding.\n"
    return -1
fi

mkdir bundle

if [ ! $GIT_IS_AVAILABLE -eq 0 ]; then 
    echo "You need to install git first!\n"
    return -1
fi

git clone git://github.com/Shougo/neobundle.vim bundle/neobundle.vim
