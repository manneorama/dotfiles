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
GITCONFIG=$HOME/.gitconfig
REALGITCONFIG=$THIS_DIR/git/gitconfig
XRC=$HOME/.Xresources
XRCD=$HOME/.Xresources.d
REALXRC=$THIS_DIR/xrc/Xresources
REALXRCD=$THIS_DIR/xrc/Xresources.d
FZFDIR=$HOME/fzf
REALFZFDIR=$THIS_DIR/fzf
ZSHCONF=$HOME/.zshrc
REALZSHCONF=$THIS_DIR/zsh/zshrc
OHMYZSHDIR=$HOME/.oh-my-zsh
REALOHMYZSHDIR=$THIS_DIR/zsh/ohmyzsh
OHMYCUSTOMDIR=$HOME/.oh-my-zsh-custom
REALOHMYCUSTOMDIR=$THIS_DIR/zsh/ohmyzsh-custom

echo "+ installing tmux.conf"
ln -sf $REALTMUXCONF $TMUXCONF
ln -sf $REALTMUXDIR $TMUXDIR

echo "+ installing vimrc"
ln -sf $REALVIMRC $VIMRC
ln -sf $REALVIMDIR $VIMDIR

echo "+ installing gitconfig"
ln -sf $REALGITCONFIG $GITCONFIG

echo "+ installing xresources"
ln -sf $REALXRC $XRC
ln -sf $REALXRCD $XRCD

echo "+ installing powerline fonts"
./fonts/install.sh

echo "+ installing fzf"
ln -sf $REALFZFDIR $FZFDIR

echo "+ installing zshrc"
ln -sf $REALZSHCONF $ZSHCONF

echo "+ installing ohmyzsh"
ln -sf $REALOHMYZSHDIR $OHMYZSHDIR
ln -sf $REALOHMYCUSTOMDIR $OHMYCUSTOMDIR

echo "+ done"
