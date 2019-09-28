#!/usr/bin/env bash

# C-things
pacman -S --noconfirm gcc clang
pacman -S --noconfirm valgrind gdb

# Necessary things for dev environments
pacman -S --noconfirm git

# ZSH! A better alternative to bash
pacman -S --noconfirm zsh

# Shared folders
pacmas -S --noconfirm nfs-utils
