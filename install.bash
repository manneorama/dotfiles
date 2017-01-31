#!/usr/bin/env bash

echo "+ initializing submodules"
git submodule update --init --recursive

THIS_DIR=$(readlink -f .)
TMUXCONF=$HOME/.tmux.conf
REALTMUXCONF=$THIS_DIR/tmux/tmux.conf
TMUXDIR=$HOME/.tmux
REALTMUXDIR=$THIS_DIR/tmux/tmux
VIMRC=$HOME/.vimrc
REALVIMRC=$THIS_DIR/vim/vimrc
VIMDIR=$HOME/.vim
REALVIMDIR=$THIS_DIR/vim

DIRCOLORS=$HOME/.dircolors
REALDIRCOLORS=$THIS_DIR/dircolors/dircolors

## setup tmux config
echo "+ configuring tmux"
if [ -e $TMUXCONF ]; then
    echo -e "\t- $TMUXCONF exists and is a file, not touching"
else
    echo -e "\t+ creating link $TMUXCONF -> $REALTMUXCONF"
    ln -s $REALTMUXCONF $TMUXCONF
fi

if [ -d $TMUXDIR ]; then
    echo -e "\t- $TMUXDIR exists and is a file, not touching"
else
    echo -e "\t+ creating link $TMUXDIR -> $REALTMUXDIR"
    ln -s $REALTMUXDIR $TMUXDIR
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

if [ -e $DIRCOLORS ]; then
    echo -e "\t- $DIRCOLORS exists and is a file, not touching"
else
    echo -e "\t+ creating link $DIRCOLORS -> $REALDIRCOLORS"
    ln -s $REALDIRCOLORS $DIRCOLORS
fi


## install fonts
echo "+ installing powerline fonts"
./fonts/install.sh

echo "+ done"
