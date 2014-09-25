#!/bin/bash
orphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rns $(pacman -Qdtq)
  fi
}

netup() {
	ping -c 1 google.com 2> /dev/null
	while [ $? -eq 2 ]; do
		sleep 0.3
		ping -c 1 google.com 2> /dev/null
	done
	echo "Network is up"
}

wifiStart() {
	sudo rfkill block 3
	sleep 1
	sudo rfkill unblock 3
	sleep 1
	sudo ~/.scripts/nmgui.sh
}

alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -al"
alias search="find . -name"
alias goog="ping google.com"
alias nmgui="sudo ~/.scripts/nmgui.sh"
PATH=$PATH:/home/nileshp/bin
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"
# ~/.bashrc: executed by bash(2) for non-login shells.

#running interactively?
case $- in
    *i*) ;;
      *) return;;
esac

#history control
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#set format
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# enable programmable completion 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi










#=======================#
#          git          #
#=======================#

info-git-branch(){
    TEMP=$(git symbolic-ref HEAD 2>/dev/null | sed "s/refs\/heads\///g")
    echo $TEMP
    if [ -n "$TEMP" ]; then
        return 1;
    fi
    return 0
}

info-git-commits(){
    TEMP=$(git status --porcelain 2>/dev/null | grep '^[^? ] ')
    if [ -n "$TEMP" ]; then
        echo "1"
        return 1
    fi
    echo "0"
    return 0
}

info-git-changes(){
    TEMP=$(git status --porcelain 2>/dev/null | grep '^?? ')
    if [ -n "$TEMP" ]; then
        echo "1"
        return 1
    fi
    TEMP=$(git status --porcelain 2>/dev/null | grep '^.[^ ] ')
    if [ -n "$TEMP" ]; then
        echo "1"
        return 1
    fi
    echo "0"
    return 0
}

parse_git_branch="git branch 2> /dev/null | sed '/^[^*]/d' 's/* \(.*\)/ \[\1\]/' \`"
#DYNAMICS=" ${parse_git_branch}"
export PS1="`${DYNAMICS}` $PS1"










#========================#
#         colors         #
#========================#

source "$HOME/.bash/colors.sh"

PROMPT_COMMAND=precmd

precmd(){

    BRANCH=$(info-git-branch)
    SPACE=""
    if [ -n "$BRANCH" ]; then
        COMMITS=$(info-git-commits)
        if [ $? -eq 1 ]; then
            COMMITS="${bldcyn}×"
            SPACE=" "
        else
            COMMITS=""
        fi

        CHANGES=$(info-git-changes)
        if [ $? -eq 1 ]; then
            CHANGES="${bldcyn}+"
            SPACE=" "
        else
            CHANGES=""
        fi

        PROMPT_GIT="${bldwht}(${bldgrn}$BRANCH$SPACE$CHANGES$COMMITS${bldwht})"

    else
        PROMPT_GIT=""
    fi

    if [[ $EUID -eq 0 ]]; then
        PROMPT_MAIN="${bldcyn}[${txtgrn}\u${bldcyn}@${txtgrn}\h${bldcyn}]${txtgrn}\w${txtrst}"
    else
        PROMPT_MAIN="\n${bldgrn}┌┤ ${txtcyn}\u${bldgrn}@${txtcyn}\h${bldgrn} ╾> (${bldcyn}\w${bldgrn}) │ ${txtrst}"
    fi

    export PS1="${PROMPT_MAIN}${PROMPT_GIT}${bldgrn}\n└─$ ${txtrst}"
    export PS2="${bldwht}↪ ${txtrst}"

}

PATH="~/.bin:${PATH}"
export PATH
alias enterprise="ssh nileshp@nilesh.io"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias disp-extend="xrandr --auto --output HDMI1 --mode 1920x1080 --right-of eDP1"
alias disp-mirror="xrandr --auto --output HDMI1 --mode 1920x1080 --same-as eDP1"
alias disp-off="xrandr --auto --output HDMI1 --off"
alias stats="htop -p 0 | head"
alias kirk="ssh n.wpi.edu"
alias copy="xclip -sel clip"
alias dvorak="setxkbmap dvorak"
alias us="setxkbmap us"
