# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export EDITOR=vim
export PAGER='less -iM -j5 -x4'

export HISTFILESIZE=1000000
HISTTIMEFORMAT='%Y-%m-%d %T '


if [ -f ~/.alias ]; then
    . ~/.alias
fi

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export CPATH=/usr/local/include:$CPATH

