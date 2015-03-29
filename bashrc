################################ BASHRC ################################
################################# V2.0 #################################
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
## BASH Completion #####################################################
########################################################################
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Prompt vars
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
git_prefix="$IPurple git:("
git_suffix="$IPurple)$Color_Off"
git_prompt_dirty="$BIRed"
git_prompt_clean="$BIGreen"

function parse_git_dirty() {
echo $(git branch &>/dev/null;
if [ $? -eq 0 ]; then 
  echo `git status` | grep "nothing to commit" > /dev/null 2>&1;
  if [ $? -eq 0 ]; then 
    # Clean repository - nothing to commit
    echo "$git_prompt_clean" 
  else 
    # Changes to working tree
    echo "$git_prompt_dirty"
  fi 
else 
  # Prompt when not in GIT repo
  echo "$Color_Off"
fi)
}

function git_prompt_ahead() {
  if $(echo "$(git log origin/$current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$git_prompt_ahead"
  fi
}

function git_prompt_info() {
  echo "$git_prefix$(parse_git_dirty)$(current_branch)$git_suffix"
}

function get_pwd() {
  echo $PWD
}

function battery_charge() {
  if [ -e ~/.bin/batcharge.py ]; then
    echo `python ~/.bin/batcharge.py`
  else
    echo ""
  fi
}

function get_spacing() {
  local git=$(git_prompt_info)
  if [ ${#git} != 0 ]; then
    ((git=${#git}))
  else
    git=0
  fi

  local bat=$(battery_charge)
  if [ ${#bat} != 0 ]; then
    ((bat = ${#bat} - 18))
  else
    bat=0
  fi
  
  local termwidth
  ((termwidth = $(get_window_cols) - 3 - $(cnt_host) - $(cnt_pwd) - ${#bat} - ${#git} - 8)) # 8 for the clock in AM/PM format

  local spacing=""
  for i in {1...$termwidth}; do
    spacing="${spacing} "
  done
  echo $spacing
}

function get_host_info() {
  printf "$USER@$HOSTNAME"
}

function cnt_host() {
  echo $(get_host_info) | wc -c
}

function cnt_pwd() {
  echo $PWD | wc -c
}

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function precmd() {
  echo "$IBlack$Time12a $ICyan$USER$Color_Off@$Red$HOSTNAME$Color_Off: $PWD$(get_spacing)$(git_prompt_info)$(battery_charge)"
}

function get_window_cols() {
  cols=`tput cols`
  echo "$cols"
}

function get_window_lines() {
  lines=`tput lines`
  echo "$lines"
}

# Prompt
#export PS1="$IBlack$Time12a $ICyan$USER$Color_Off@$Red$HOSTNAME$Color_Off: $PWD$(get_spacing)$(git_prompt_info)$(battery_charge)
→ " 

source oh-my-git/prompt.sh