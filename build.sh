#!/usr/bin/env bash

export VAGRANT_ROOT="$HOME/vagrant_prgr"
mkdir -p $VAGRANT_ROOT

if [ ! -d $VAGRANT_ROOT/vagrant ]; then
    git clone git@github.com:karlhto/vagroant $VAGRANT_ROOT/vagrant
fi

cd $VAGRANT_ROOT/vagrant
vagrant up dev
