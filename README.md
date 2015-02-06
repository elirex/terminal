# Terminal
Provide pretty terminal screen, git log and convenient git command completion.
![image](https://elirex.github.io/repo/terminal/terminal.png)

## Install
Use "./install" command to install will copy your original ".bashrc" file to orgConfigure.
```shellscript
$ git clone https://github.com/elirex/terminal.git
$ cd termainl
$ chmod u+x install
$ ./install
```

Add command under the .gitconfig's [alias]
```
l = "!source ~/.dotfiles/.gitlog && git_complete_log"
bl = "!source ~/.dotfiles/.gitlog && git_branch_log"
```

