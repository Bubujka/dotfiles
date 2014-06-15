[[ -s "$HOME/.rvm/scripts/rvm" ]] && \
  . "$HOME/.rvm/scripts/rvm"

. "$HOME/.password"
export DEBUG='app:*'
export NODE_ENV='development'
export PRJ_ENV='dev'

export PATH=$HOME/.usr/bin:$PATH:$HOME/.rvm/bin 
export PATH=$HOME/.node/bin:$HOME/.bu.bin/bin:$HOME/.db/bin/stable:$HOME/.db/bin:$PATH
export PATH=$PATH:$HOME/.beta.bin/bin
export PATH=$PATH:$HOME/.omega.bin/bin
export PATH=$PATH:$HOME/.bu.cards/bin
export PATH=$PATH:$HOME/.bu.bin/bin
. ~/.bu.bin/alias
source ~/.ssh_agent_info


complete -cf sudo
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export EDITOR=vim
export PS1='\n\[\033[32m\]\u@\h\[\033[36m\] \w\[\033[33m\]$(__git_ps1)\[\033[34m\]\n\$\[\033[00m\] '

export GIT_PS1_SHOWDIRTYSTATE=1
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

source ~/.bu.bin/alias

complete -C ~/.db/bin/completion/rake -o default rake
complete -C ~/.db/bin/completion/fill ./fill
complete -C ~/.db/bin/completion/task ./task
complete -C ~/.db/bin/completion/mode mode
complete -C ~/.db/bin/completion/life life
complete -C ~/.db/bin/completion/prog prog
complete -C ~/.db/bin/completion/tt tt
stty stop undef



