alias ls='ls -1 --color=auto --group-directories-first'

x() {
  local CMD

  CMD=$(runnable-files | \
	  grep -v artisan | \
	  sort -n | \
	  fzf +m \
	  --header="Выбор скрипта серверов" \
	  --preview-window '70%' \
	  --preview='bat --color always {} |  head -$LINES')
  if [[ "$CMD" != "" ]]; then
    echo $CMD
    echo $CMD | xclip
    $CMD
  fi
}
