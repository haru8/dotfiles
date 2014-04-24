#!/bin/bash

FILES='.alias
.bash_logout
.bash_profile
.bashrc
.editrc
.exrc
.prompt
.screenrc
.tmux.conf
.vimrc'


for file in $FILES; do
    CMD="ln -s ~/dotfiles/${file} ~/${file}"
    echo $CMD
    eval $CMD
done

