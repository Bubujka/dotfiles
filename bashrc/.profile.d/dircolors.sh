# Раскрашиваем вывод каталогов
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    
    # Делаем греп цветным
    alias grep='grep --color=auto'
fi
