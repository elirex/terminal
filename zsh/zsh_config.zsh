autoload -Uz compinit && compinit
autoload -Uz vcs_info
autoload colors && colors
setopt PROMPT_SUBST
zstyle ':vcs_info:*' formats ' %s:(%b)'

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info ) 

PROMPT='%F{yellow}%n%F{white}@%F{green}%m%F{red}[%~]%F{blue}${vcs_info_msg_0_} %F{white}$ '
