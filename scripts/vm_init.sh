#!/usr/bin/env bash

# ZSH! A better alternative to bash
sudo apt-get -y install zsh

# Neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get -y update
sudo apt-get -y install neovim

pip3.5 install --user neovim
