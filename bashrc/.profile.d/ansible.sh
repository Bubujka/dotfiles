av() {
  local dir
  unset DEBUG;
  dir=$(ag ANSIBLE_VAULT -l | fzf +m --header="Открытие зашифрованного файла") && ansible-vault edit "$dir"
}


fap() {
  local dir
  unset DEBUG;
  GROUP=$(cat hosts.ini  | grep '^\[' | tr -d '[]' | sort | \
	  fzf +m --header="Выбор группы серверов" --preview='ansible-hosts-in-group {} | bat --color always |  head -$LINES')

  PLAYBOOK=$(find playbooks -type f -iname '*.yml' | sort | \
	  fzf +m --header="Выбор плэйбука" --preview='bat --color always {} | head -$LINES')


  echo "Команда для запуска уже в буфере обмена"
  echo "ansible-playbook -l \"$GROUP\" $PLAYBOOK"
  echo "ansible-playbook -l \"$GROUP\" $PLAYBOOK" | xclip
}


