########################################################################
################################ BASHRC ################################
################################# V1.0 #################################
########################################################################
## Interactive Mode ####################################################
########################################################################
[ -z "$PS1" ] && return

########################################################################
## History #############################################################
########################################################################
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth
shopt -s histappend

########################################################################
## Geometry ############################################################
########################################################################
shopt -s checkwinsize

########################################################################
## Less ################################################################
########################################################################
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

########################################################################
## Chroot Check ########################################################
########################################################################
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

########################################################################
## Xterm ###############################################################
########################################################################
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

########################################################################
## Misc Cmds ###########################################################
########################################################################
alias cls='clear;ls --color'
alias cdc='clear;cd'

########################################################################
## Package Mgmt ########################################################
########################################################################
# Debian
alias findme='sudo apt-cache search'
alias getme='sudo apt-get install'
alias up='sudo apt-get upgrade'
alias upp='sudo apt-get update'
alias distup='sudo apt-get dist-upgrade'
# Gentoo
# alias findme='sudo emerge search'
# alias getme='sudo emerge install'

########################################################################
## File Mgmt############################################################
########################################################################
alias rm='rm -rf'
# Android Phone
alias android-connect="mtpfs -o allow_other /media/sgs2"
alias android-disconnect="fusermount -u /media/sgs2"

########################################################################
## Networking ##########################################################
########################################################################
# Web Space
alias vendetta='ssh soncthedgehog@vendetta.spinsugar.com'	# misc space
alias me='ssh ner0tic@daviddurost.net'          			# portfolio
alias home='ssh ner0tic.doesntexist.net -p 2222'			# home
# Laptop
alias silvereagle='ssh silverEagle'     
alias silverEagle=silvereagle                   			# offical
alias silver=silvereagle                        			# shortcut
# Windows
alias blackhawk='ssh blackHawk'         
alias blackHawk=blackhawk                       			# offical
alias bhawk=blackhawk                           			# shortcut
# File Server
alias purplepidgin='ssh purplePidgin'   
alias purplePidgin=purplepidgin                 			# offical
alias purple=purplepidgin                       			# shortcut
# Desktop
alias redphoenix='ssh redPhoenix'       
alias redPhoenix=redphoenix                     			# official 
alias phoenix=redphoenix                        			# shortcut
# Netbook
alias orangeostrich='ssh orangeOstrich'
alias orangeOstrich=orangeostrich               			# offical
alias orange=orangeostrich                      			# shortcut

########################################################################
## system nav###########################################################
########################################################################
alias myVids='cd /media/Video/Videos'
alias myTv=myVids+'/Tv\ Shows'
alias myMovies=myVids+'/Movies'
alias myAudio='cd /media/67eccc8d-4011-4633-8b3b-c3c084767099'
alias myItunes=myAudio+'/ddMusic'

########################################################################
## BASH Completion #####################################################
########################################################################
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

########################################################################
## BASH PROMPT##########################################################
########################################################################
# Colors
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
# Prompt
PS1="\[\016\]l\[\017\](${HBLU}\u@${RED}\h${NORM})-()-(${REDBRN}\t@\d${NORM})--->
\[\016\]m\[\017\]-(${HBLU}\w/${NORM})--> "

