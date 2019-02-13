#!/usr/bin/env bash

export VAGRANT_ROOT="$HOME/vagrant_root"
mkdir -p $VAGRANT_ROOT

if [ ! -d $VAGRANT_ROOT/vagrant ]; then
    git clone git@github.uio.no:karlhto/vagroant $VAGRANT_ROOT/vagrant
fi

cd $VAGRANT_ROOT/vagrant
vagrant up dev
