#!/usr/bin/env bash

# C-things
sudo pacman -S --noconfirm gcc clang
sudo pacman -S --noconfirm valgrind gdb

# Necessary things for dev environments
sudo pacman -S --noconfirm git

# ZSH! A better alternative to bash
sudo pacman -S --noconfirm zsh

# Shared folders
sudo pacman -S --noconfirm nfs-utils
