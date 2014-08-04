export VIDEO_RECORDING_RESOLUTION='1600x900' # у меня такой экран
export VIDEO_CONVERT_RESOLUTION='1280x720' # ютуб до такого размера пожмёт всё равно. Заливать меньше
export VIDEO_SAVING_PATH=~/.db/history/video 
export MIC_SAVING_PATH=~/.db/history/mic
export VOICEMAIL_SAVING_PATH=~/.db/history/voicemail
export NAMED_MIC_SAVING_PATH=~/.db/history/talk
export PRJ_REPOSITORY="git@github.com:Bubujka/prj.git" # реп для мелких приватных проектов
export ADMIN_EMAIL="zendzirou@gmail.com"
export BROWSER="google-chrome"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && \
  . "$HOME/.rvm/scripts/rvm"

. "$HOME/.password"
export DEBUG='app*'
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

nu() {
  for dir in `find ~/ -type d -name '.git'`
  do
    cd $dir;
    cd ..
    if [ $(git status --porcelain | wc -l ) != 0 ] ;
    then
      git status
      return
    fi
  done
  cd
}

gua() {
  for dir in `find ~/ -type d -name '.git'`
  do
    cd $dir;
    cd ..
    basename "$(pwd)" 
    pwd
    git pull
    echo
  done
  nu
}

uunu() {
  uu 
  nu
}

PATH=$PATH:$HOME/.beta.bin/bin
