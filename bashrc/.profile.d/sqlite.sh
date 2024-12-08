ti() {
	SELECT="select tbl_name from sqlite_master where type = 'table' order by 1;"
	NAME=$(sqlite3  -noheader database/database.sqlite "$SELECT" 2> /dev/null  | sort | \
		  fzf +m \
		  --header="Выбор скрипта серверов" \
		  --preview-window '70%' \
		  --preview='sqlite3 -column database/database.sqlite  "pragma table_info({})" | bat --color always |  head -$LINES')
	if [[ "$NAME" != "" ]]; then
		echo "Просмотр таблицы $NAME"
		echo
		./artisan db:table $NAME
		history -s "./artisan db:table $NAME"
	fi
}
tid() {
	SELECT="select tbl_name from sqlite_master where type = 'table' order by 1;"
	NAME=$(sqlite3  -noheader database/database.sqlite "$SELECT" 2> /dev/null  | sort | \
		  fzf +m \
		  --header="Выбор скрипта серверов" \
		  --preview-window '70%' \
		  --preview='sqlite3 -column database/database.sqlite  "pragma table_info({})" | bat --color always |  head -$LINES')
	if [[ "$NAME" != "" ]]; then
		echo "Просмотр таблицы $NAME"
		echo
		sqlitebrowser database/database.sqlite -t $NAME
		history -s "sqlitebrowser database/database.sqlite -t $NAME"
	fi
}
