export GIT_PS1_SHOWDIRTYSTATE=1

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
LANGVM=""

__prompt_command() {
    local EXIT="$?"             # This needs to be first

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
    PS1='\n\[\033[32m\]\u@\h\[\033[36m\] $LANGVM \w\[\033[33m\]$(__git_ps1)\[\033[34m\]\n\n'
    if [ ! -z ${ASCIINEMA_REC+x} ]; then
        PS1+="🎥 "
    fi
    if [ $EXIT != 0 ]; then
        PS1+="${Red}${EXIT} \$${RCol} "
    else
        PS1+="\$${RCol} "
    fi
}
