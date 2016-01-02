for i in ~/.profile.d/*.sh; do
  if [ -r $i ]; then
    . $i
  fi
done
unset i

. ~/.bu.bin/alias

complete -cf sudo
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

source ~/.bu.bin/alias
complete -C ~/.db/bin/completion/rake -o default rake

. ~/.bin-private/beta.bin/include
