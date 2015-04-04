# bashrc [cbpp]
# Read in aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Read in colors
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Read in completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Read in oh-my-git prompt
source .oh-my-git/prompt.sh