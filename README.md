# Terminal
Provide pretty terminal screen, git log and convenient git command completion.

## Install
```shellscript
$ git clone https://github.com/elirex/terminal.git ~/.terminal
$ cd ~/.terminal
$ chmod a+x install
$ ./install
```

### Import 
Add the below setting into `.bashrc` or `.zshrc` 
```shellscript
if [[ -f ~/.terminal/shell_config.sh ]]; then
    . ~/.terminal/shell_config.sh
fi
```
