# Автодополнение включаем основное
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Автодополнение для sudo зачем то~~
complete -cf sudo
