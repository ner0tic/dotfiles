# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
## misc cmds
alias cls='clear;ls --color'
alias cdc='clear;cd'
## package mgmt
alias findme='sudo apt-cache search'
alias getme='sudo apt-get install'
alias up='sudo apt-get upgrade'
alias upp='sudo apt-get update'
alias distup='sudo apt-get dist-upgrade'
## file mgmt
alias rm='rm -rf'
## networking
alias vendetta='ssh soncthedgehog@vendetta.spinsugar.com'       # web space
alias silvereagle='ssh ner0tic@silverEagle'     # laptop
alias silverEagle=silvereagle                   # laptop (offical name)
alias silver=silvereagle                        # laptop (shortcut)
alias blackhawk='ssh ner0tic@blackHawk'         # win 7
alias blackHawk=blackhawk                       # win 7 (offical name)
alias bhawk=blackhawk                           # win 7 (shortcut)
alias purplepidgin='ssh ner0tic@purplePidgin'   # media dumpster
alias purplePidgin=purplepidgin                 # media dumpster (offical name)
alias purple=purplepidgin                       # media dumpster (shortcut)
alias redphoenix='ssh ner0tic@redPhoenix'       # desktop
alias redPhoenix=redphoenix                     # desktop (official name)
alias phoenix=redphoenix                        # desktop (shortcut)
alias matttunnel='ssh homepos.dyndns.org -p 2222 -l ner0tic -R 6543:localhost:22'       # POS (cali)
alias me='ssh ner0tic@daviddurost.net'          # portfolio site
alias orangeostrich='ssh ner0tic@orangeOstrich' # netbook
alias orangeOstrich=orangeostrich               # netbook (offical name)
alias orange=orangeostrich                      # netbook (shortcut)
## system nav
alias myVids='cd /media/73d97d40-e651-413c-a2e6-ff412c42b6a7/Videos'
alias myTv=myVids+'/Tv\ Shows'
alias myMovies=myVids+'/Movies'
alias myAudio='cd /media/67eccc8d-4011-4633-8b3b-c3c084767099'
alias myItunes=myAudio+'/Music'
## BASH Completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
## BASH PROMPT
# Color Variables for Prompt
GRAD1='\333\262\261\260'
GRAD2='\260\261\262\333'
YLOBRN='\[\033[01;33;43m\]'
WHTBRN='\[\033[01;37;43m\]'
REDBRN='\[\033[00;31;43m\]'
REDBLK='\[\033[00;31;40m\]'
PPLBLK='\[\033[01;35;40m\]'
WHTBLK='\[\033[01;37;40m\]'
NONE='\[\033[00m\]'
HBLK='\[\033[00;30;30m\]'
HBLU='\[\033[01;34;34m\]'
BLU='\[\033[00;34;34m\]'
YEL='\[\033[00;33;33m\]'
WHT='\[\033[01;37;37m\]'
PRPL='\[\033[00;34;35m\]'
RED='\[\033[01;31;31m\]'
NORM='\[\033[01;00;0m\]'
# Prompt Formatting
PS1="\[\016\]l\[\017\](${HBLU}\u@${RED}\h${NORM})-()-(${REDBRN}\t@\d${NORM})--->
\[\016\]m\[\017\]-(${HBLU}\w/${NORM})--> "
alias android-connect="mtpfs -o allow_other /media/sgs2"
alias android-disconnect="fusermount -u /media/sgs2"
