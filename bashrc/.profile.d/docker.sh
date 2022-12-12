dfs() {
  local dir
  dir=$(docker ps --format '{{.Names}}' | fzf +m --header="Переход к контейнеру") && set_xterm_title "xterm DOCKER to $dir" && docker exec -ti "$dir" bash ; set_xterm_title "xterm"
}
