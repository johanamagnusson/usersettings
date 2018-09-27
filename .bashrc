#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

export PS1="[\u@\w]\[$(tput sgr0)\] "
export EDITOR="nvim"
export VISUAL="nvim"


# ALIASES
alias vim="nvim"
alias ls="ls --group-directories-first --color"
alias python="python3"
alias pycharm="~/Applications/pycharm-community-2016.1.4/bin/pycharm.sh"
alias listports="/home/anma/dev/git/src/SW/SW0026-PC_Software/11-Trabus3Debugger/showDebug.py -l"
alias trup="python3.5 /home/andreas/dev/git/tools/gitTools/handleRepoListDef.py /home/andreas/dev/git/CFG.repoListDef"
alias conlab="ssh andreas@192.168.11.20"
alias lh="/home/anma/dev/git/home/andreas2/AutomatedTesting/runTests.py -lh"
alias st="rsync -tr andreas@192.168.11.20:~/data/testdata/master ~/testdata &&
    rsync -tr ~/testdata /mnt/data/testdata"
alias ll="ls -l"
alias gits="git status"
alias ch="cpath ."
alias cds="cd /home/andreas/dev/git/src/SW/SW0026-PC_Software"
alias gitsmu="git submodule update --recursive --init"
alias flash="/home/andreas/dev/git/src/SW/SW0026-PC_Software/44-TextFlasherIII/tf3.py"
alias tag="/home/andreas/dev/git/tools/gitTools/tagging/makeTag.py"
alias grep="grep -rn -I"

cpath() {
  realpath $1 | tr -d "\n" | xclip -selection CLIPBOARD
}

eval `dircolors ~/.dir_colors`

if [ $(basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //')) == "yakuake" ]; then
# go to last active cwd
  if [ -e /dev/shm/$USER-yakuake-cwd ]; then
    cd "$(cat /dev/shm/$USER-yakuake-cwd)"
  fi
# on each stroke of the return key, save cwd in a shared memory
  export PS1=$PS1'$(pwd > /dev/shm/$USER-yakuake-cwd)'
fi
export GOPATH=$HOME/go
export PATH=$GOPATH:$GOPATH/bin:$PATH
export TRAB_GIT_ROOT=/home/andreas/dev/git
