p() {
  local dir
  dir=$(_projects | fzf +m) && cd $(_projects -e "$dir")
}

d() {
  local dir
  dir=$(ls ~/.db/ | fzf +m) && cd ~/.db/"$dir"
}

w() {
  local dir
  dir=$(ls ~/.db/wiki/ | fzf +m) && vim ~/.db/wiki/"$dir"
}
