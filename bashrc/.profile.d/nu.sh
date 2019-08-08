nu() {
  if [ ! -f ~/.git-repos ]; then
    echo "Нет файла +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi

  if test "`find ~/.git-repos -mmin +10`"; then
    echo "Кэш старый +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi
  for dir in `cat ~/.git-repos | grep -v .gvm | grep -v .nvm`
  do
    echo $dir
    if [ -d "$dir" ]; then
      cd $dir;
      cd ..
      if [ $(cat .git/config | grep 'remote "origin"' | wc -l) == 0 ] ;
      then
        echo
        echo "У репозитория нет origin!"
        git status
        return
      fi
      if [ $(git status --porcelain | wc -l ) != 0 ] ;
      then
        echo
        echo "Надо закоммитить"
        git status
        return
      fi
      if [ $(git log --branches --not --remotes | wc -l ) != 0 ] ;
      then
        echo
        echo "Не всё отправлено на сервер"
        git log --branches --not --remotes --simplify-by-decoration --decorate --oneline
        return
      fi
    else
      echo "$dir"
      echo -n 'm'
    fi
  done
  cd
}

nun() {
  if [ ! -f ~/.git-repos ]; then
    echo "Нет файла +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi

  if test "`find ~/.git-repos -mmin +10`"; then
    echo "Кэш старый +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi
  for dir in `cat ~/.git-repos`
  do
    if [ -d "$dir" ]; then
      echo -n '.'
      cd $dir;
      cd ..
      if [ $(cat .git/config | grep 'remote "origin"' | wc -l) == 0 ] ;
      then
        echo
        echo "У репозитория нет origin!"
        git status
        return
      fi
      if [ $(git status --porcelain | wc -l ) != 0 ] ;
      then
        echo
        echo "Надо закоммитить"
        git status
        return
      fi
    else
      echo -n 'm'
    fi
  done
  cd
}
alias гг='uu'
alias ггтг='uunu'
uunu() {
  uu
  nu
}

global-pull() {
  if [ ! -f ~/.git-repos ]; then
    echo "Нет файла +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi

  if test "`find ~/.git-repos -mmin +10`"; then
    echo "Кэш старый +_+"
    find ~/ -type d -name '.git' > ~/.git-repos
  fi

  for dir in `cat ~/.git-repos | grep -v .gvm`
  do
    cd "$dir";
    cd ..
    pwd
    git fetch --all
    echo
  done
  nu
}
