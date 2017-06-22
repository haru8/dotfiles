# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions

export EDITOR=vim
export PAGER='less -iM -j5 -x4 -X'

export HISTFILESIZE=1000000
export HISTSIZE=5000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y-%m-%d %T '


if [ -f ~/.alias ]; then
    . ~/.alias
fi

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LIBRARY_PATH
export LDPATH=/usr/local/lib:/usr/lib:/usr/local/lib64
export CPATH=/usr/local/include:$CPATH

