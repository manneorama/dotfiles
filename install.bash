#!/usr/bin/env bash

echo "+ initializing submodules"
git submodule update --init --recursive

echo "+ patching font installation file"
patch -p0 < ./fonts.patch

THIS_DIR=$(readlink -f .)
TMUXCONF=$HOME/.tmux.conf
REALTMUXCONF=$THIS_DIR/tmux/tmux.conf
VIMRC=$HOME/.vimrc
REALVIMRC=$THIS_DIR/vim/vimrc
VIMDIR=$HOME/.vim
REALVIMDIR=$THIS_DIR/vim

## setup tmux config
echo "+ configuring tmux"
if [ -e $TMUXCONF ]; then
    echo -e "\t- $TMUXCONF exists and is a file, not touching"
else
    echo -e "\t+ creating link $TMUXCONF -> $REALTMUXCONF"
    ln -s $REALTMUXCONF $TMUXCONF
fi

## setup vim
echo "+ configuring vim"
if [ -e $VIMRC ]; then
    echo -e "\t- $VIMRC exists and is a file, not touching"
else
    echo -e "\t+ creating link $VIMRC -> $REALVIMRC"
    ln -s $REALVIMRC $VIMRC
fi

if [ -d $VIMDIR ]; then
    echo -e "\t- $VIMDIR exists and is a directory, not touching"
else
    echo -e "\t+ creating link $VIMDIR -> $REALVIMDIR"
    ln -s $REALVIMDIR $VIMDIR
fi

echo "+ done"
