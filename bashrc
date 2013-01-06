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
# Reset
Color_Off="\[\033[0m\]"       # Text Reset
# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White
# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White
# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White
# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White
# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White
# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White
# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Prompt vars
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# Prompt
export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$IYellow$PathShort$Color_Off' → "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$IYellow$PathShort$Color_Off' → "; \
fi)'

#PS1="\[\016\]l\[\017\](${IBlue}\u@${Red}\h${Color_Off})-()-(${Green}\t@\d${Color_Off})--->
#\[\016\]m\[\017\]-(${Blue}\w/${Color_Off)--> "

