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
.vimrc
.gitconfig
.my.cnf'


for file in $FILES; do
    CMD="ln -sf ~/dotfiles/${file} ~/${file}"
    echo $CMD
    eval $CMD
done

