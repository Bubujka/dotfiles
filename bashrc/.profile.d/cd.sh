# Команды для перехода в различные места

# Выбор и переход к проекту
p() {
	local dir
	dir=$(_projects | fzf +m) && cd $(_projects -e "$dir")
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

	if [ -d venv ]; then
		use-venv
	fi
}

# Переход в подкаталог основного места хранения всего
d() {
  local dir
  dir=$(ls ~/.db/ | fzf +m) && cd ~/.db/"$dir"
}

# Открытие в виме вики файла
w() {
  local dir
  dir=$(ls ~/.db/wiki/ | fzf +m) && vim ~/.db/wiki/"$dir"
}

# Переход на каталог выше
alias ..='cd ../'

# Переход к папке с моими скриптами
alias bin='cd ~/.bu.bin/bin'

# Переход к папке с загрузками
alias _='cd ~/.db/_'
