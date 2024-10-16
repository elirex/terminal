eval "$(/opt/homebrew/bin/brew shellenv)"

OS_TYPE=`uname`
SHELL_TYPE=`ps -o comm= $$`

alias vi='vim'
alias py3='python3'
alias py2='python2'

# The OS is Mac OS X
if [[ "$OS_TYPE" = "Darwin" ]]; then
    alias ll='ls -alF'
    export CLICOLOR='true'
    export TERM="xterm-256color"
    export LSCOLORS=Exfxcxdxxxegedabagacad
fi

if [[ "$SHELL_TYPE" = "-zsh"  || "$SHELL_TYPE" = "/bin/zsh" ]]; then
    source ~/.terminal/zsh/zsh_config.zsh
else
    source ~/.terminal/bash/bash_config.bash
fi
