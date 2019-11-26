#!/bin/sh
sudo apt install curl git wget -y
cd ~
wget https://raw.githubusercontent.com/arrayJY/vimrc/master/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
