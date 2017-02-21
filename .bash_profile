# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH
export PATH
#export PYTHONPATH=/usr/local/python2.7/lib/python2.7/site-packages/

#export TERM=xterm-256color
export TERM=xterm
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig
export SSH_ASKPASS=~/bin/git_pass.sh

agent="$HOME/tmp/ssh-agent-$USER"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi

if [ -n $SSH_TTY ]; then
    #screen -xRR
    #tmux attach || tmux new-session
    tmux has-session >/dev/null 2>&1
    if [ $? -eq 0 -a -z "$TMUX" ]; then
      tmux -2u attach
      #tmux -2u attach -d
    else
      tmux -2u new-session
    fi
fi

