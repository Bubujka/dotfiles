alias ls='ls -1 --color=auto --group-directories-first'

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
        LAST=$(ls | egrep '^0' | sort | tail -1 | sed 's/-.*//' | sed 's/^0*//')
        NEXT=$((LAST + 1))

	if [ -f .xx ]; then
		EXT=$(cat .xx)
		read -p "Как файл назовём (будет файл $EXT): " filename
		FULLNAME=$(printf %04d $NEXT)-$filename$EXT
	else
		read -p "Как файл назовём (с расширением): " filename
		FULLNAME=$(printf %04d $NEXT)-$filename
	fi
	if [[ -z "$filename" ]]; then
		return
	fi

	if [[ "$FULLNAME" == *.tcl ]]; then
		echo "#!/usr/bin/env tclsh" > $FULLNAME
	elif [[ "$FULLNAME" == *.sh ]]; then
		echo "#!/bin/bash" > $FULLNAME
	elif [[ "$FULLNAME" == *.php ]]; then
		echo "#!/usr/bin/env php" > $FULLNAME
	else
		echo "#!/bin/bash" > $FULLNAME
	fi

        echo "" >> $FULLNAME
        chmod +x $FULLNAME
        open-in-gvim $(pwd)/$FULLNAME
        history -s "./$FULLNAME"
}
