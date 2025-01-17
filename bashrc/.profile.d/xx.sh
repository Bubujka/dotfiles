wx() {
  local CMD

  CMD=$( cd ~/.db/wiki; find . -maxdepth 1 -perm -111 -type f -printf '%f\n' | \
	  grep -v artisan | \
	  sort -n | tac | \
	  fzf +m \
	  --header="Выбор скрипта серверов" \
	  --preview-window '70%' \
	  --preview='bat --color always {} |  head -$LINES')
  if [[ "$CMD" != "" ]]; then
    echo . ~/.db/wiki/$CMD
    echo . ~/.db/wiki/$CMD | xclip
    history -s ". ~/.db/wiki/$CMD"
    . ~/.db/wiki/$CMD
  fi
}

x() {
  local CMD

  CMD=$(runnable-files | \
	  grep -v artisan | \
	  sort -n | tac | \
	  fzf +m \
	  --header="Выбор скрипта серверов" \
	  --preview-window '70%' \
	  --preview='bat --color always {} |  head -$LINES')
  if [[ "$CMD" != "" ]]; then
    echo $CMD
    echo $CMD | xclip
    history -s "$CMD"
    $CMD
  fi
}

function xx(){
	if [[ "$1" == "init" ]]; then
		touch .xx-ext
		touch .xx-tpl
		echo "Файлы созданы"
		return;
	fi


        LAST=$(ls | egrep '^0' | sort | tail -1 | sed 's/-.*//' | sed 's/^0*//')
        NEXT=$((LAST + 1))

	EXT=".sh"
	if [ -f .xx-ext ]; then
		EXT=$(cat .xx-ext)
	fi

	if [ -f .xx-tpl ]; then
		read -p "Как файл назовём (будет использован шаблон .xx-tpl): " filename
	else
		read -p "Как файл назовём: " filename
	fi

	if [[ -z "$filename" ]]; then
		return
	fi

	FULLNAME=$(printf %04d $NEXT)-$filename$EXT

	if [ -f .xx-tpl ]; then
		cat .xx-tpl > $FULLNAME
	else
		echo "#!/bin/bash" > $FULLNAME
	fi

        echo "" >> $FULLNAME
        chmod +x $FULLNAME
        open-in-gvim $(pwd)/$FULLNAME
        history -s "./$FULLNAME"
}
