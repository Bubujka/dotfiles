av() {
  local dir
  unset DEBUG;
  dir=$(ag ANSIBLE_VAULT -l | fzf +m --header="Открытие зашифрованного файла") && ansible-vault edit "$dir"
}


fap() {
	echo "Выполняем команду";
	cat .fap~
	sleep 1
	. .fap~
}

refap() {
  local dir
  unset DEBUG;
  GROUP=$(cat hosts.ini  | grep '^\[' | tr -d '[]' | sort | \
	  fzf +m --header="Выбор группы серверов" --preview='ansible-hosts-in-group {} | bat --color always |  head -$LINES')

  PLAYBOOK=$(find playbooks -type f -iname '*.yml' | sort | \
	  fzf +m --header="Выбор плэйбука" --preview='bat --color always {} | head -$LINES')


  echo "Команда для запуска (или просто fap)"
  echo "ansible-playbook -l \"$GROUP\" $PLAYBOOK"
  echo "ansible-playbook -l \"$GROUP\" $PLAYBOOK" |xclip
  echo "ansible-playbook -l \"$GROUP\" $PLAYBOOK" > .fap~
}


