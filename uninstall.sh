#!/usr/bin/env bash

app_dir="$HOME/.larrylu-vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# rm $HOME/.vimrc
# rm $HOME/.vimrc.bundles
# rm $HOME/.vim
rm -rf $HOME/.vim*

rm -rf $app_dir
