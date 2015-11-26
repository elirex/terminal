# Set alias
alias ll='ls -alF'

# git completion
if [ -f ~/.dotfiles/.git-completion.bash ]; then
	source ~/.dotfiles/.git-completion.bash
fi

parse_git_branch() {
	#git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	#git branch 2> /dev/null | grep "^\*" | sed -e "s/^\*\ //"
	git branch 2> /dev/null | grep "^\*" | sed -e "s/^\*\ //"
	#git branch 2> /dev/null | sed -e '/^[^*]/d'
}

show_git_branch() {
	branch="$(parse_git_branch)"
	if [ "$branch" != "" ]; then
		#echo -e " \033[1;34mgit:(\033[1;31m$branch\033[1;34m)"
		echo -e " git:($branch)"
	fi
}

export PS1="\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;31m\][\w]\[\033[1;34m\]\$(show_git_branch)\[\033[1;36m\] \$\[\033[0m\] "
