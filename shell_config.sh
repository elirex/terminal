OS_TYPE=`uname`
SHELL_TYPE=`ps -o comm= $$`

if [[ "$OS_TYPE" = "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias vi='vim'
alias py3='python3'
alias py2='python2'
alias ll='ls -alF --color=auto'

# The OS is Mac OS X
if [[ "$OS_TYPE" = "Darwin" ]]; then
    export CLICOLOR='true'
    export TERM="xterm-256color"
    export LSCOLORS=Exfxcxdxxxegedabagacad
fi

if [[ "$SHELL_TYPE" = "-zsh"  || "$SHELL_TYPE" = "/bin/zsh" || "$SHELL_TYPE" =
"zsh" ]]; then
    source ~/.terminal/zsh/zsh_config.zsh
else
    source ~/.terminal/bash/bash_config.bash
fi
