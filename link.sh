#!/bin/bash

FILES='.alias
.bash_logout
.bash_profile
.bashrc
.editrc
.exrc
.link.sh.swp
.prompt
.screenrc
.tmux.conf
.vimrc'


for file in $FILES; do
    echo ln -s ~/dotfiles/${file} ~/${file}
    #ln -sf ~/dotfiles/${file} ~/${file}
done

