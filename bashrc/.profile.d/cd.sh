# Команды для перехода в различные места

# Выбор и переход к проекту
p() {
	local dir
	dir=$(_projects | fzf +m) && cd $(_projects -e "$dir")
	set_xterm_title "xterm WORKING in $dir"
	if [ -f .nvmrc ]; then
		use-nvm
		echo "Switching node: "
		cat .nvmrc
		nvm use;
	fi

	if [ -f .phpbrewrc ]; then
		use-phpbrew
		echo "Switching php: " `cat .phpbrewrc`
		phpbrew use `cat .phpbrewrc`
	fi

	if [ -f .ruby-version ]; then
		use-rvm
		rvm use $(cat .ruby-version)
		#echo "Switching php: " `cat .phpbrewrc`
		#phpbrew use `cat .phpbrewrc`
	fi
	if [ -d venv ]; then
		use-venv
	fi
}

# Переход в подкаталог основного места хранения всего
d() {
  local dir
  dir=$(ls ~/.db/ | fzf +m) && cd ~/.db/"$dir"
}

# Переход к каталогу с файлами
f() {
  local dir
  dir=$(ls ~/.db/files | fzf +m --header="Переход к папке в хранилище" --preview='ls --color ~/.db/files/{} | head -$LINES') && cd ~/.db/files/"$dir"
}

# Открытие в виме вики файла
w() {
  local dir
  dir=$(ls ~/.db/wiki/ | fzf +m) && vim ~/.db/wiki/"$dir"
}

ww() {
	cd ~/.db/prj/websites/wiki
	use-rvm
	rvm use $(cat .ruby-version)
}

# Переход на каталог выше
alias ..='cd ../'

# Переход к папке с моими скриптами
alias bin='cd ~/.bu.bin/bin'

# Переход к папке с загрузками
alias _='cd ~/.db/_'


# Переход в db
alias db='cd ~/.db'


alias anki-media="cd \"$HOME/.local/share/Anki2/1-й пользователь/collection.media\""
