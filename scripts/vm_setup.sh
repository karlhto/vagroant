#!/usr/bin/env bash

# C-things
sudo apt-get -y install gcc
sudo apt-get -y install valgrind gdb
sudo apt-get -y install libc6-dev-i386 # Additional prerequisites

# Necessary things for dev environments
sudo apt-get -y install git

# Python 3.5
sudo add-apt-repository ppa:deadsnakes
sudo apt-get update
sudo apt-get -y python3.5

# pip
curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.5
