av() {
  local dir
  unset DEBUG;
  dir=$(ag ANSIBLE_VAULT -l | fzf +m --header="Открытие зашифрованного файла") && ansible-vault edit "$dir"
}
