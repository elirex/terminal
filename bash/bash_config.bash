if [[ -f ~/.terminal/bash/git_completion.bash ]]; then
    source ~/.terminal/bash/git_completion.bash
fi

parse_git_branch() {
    git branch 2> /dev/null | grep "^\*" | sed -e "s/^\*\ //"
}

show_git_branch() {
    branch="$(parse_git_branch)"
    if [[ "$branch" != "" ]]; then
        echo -e " git:($branch)"
    fi
}
export PS1="\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;31m\][\w]\[\033[1;34m\]\$(show_git_branch)\[\033[1;36m\] \$\[\033[0m\] "
