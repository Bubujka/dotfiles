gc(){
  URL=$(cat ~/.reps | sed 's/^.*https/https/' | fzf)
  if [[ -z "$URL" ]]
  then
    return
  fi
  REPOSITORY="${URL/https:\/\//git@}"
  REPOSITORY="${REPOSITORY/\//:}"
  echo "Choosed: $REPOSITORY"
  git clone "$REPOSITORY"
}
gc1(){
  URL=$(cat ~/.reps | sed 's/^.*https/https/' | fzf)
  if [[ -z "$URL" ]]
  then
    return
  fi
  REPOSITORY="${URL/https:\/\//git@}"
  REPOSITORY="${REPOSITORY/\//:}"
  echo "Choosed: $REPOSITORY"
  git clone --depth 1 "$REPOSITORY"
}
