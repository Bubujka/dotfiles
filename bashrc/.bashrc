for i in ~/.profile.d/*.sh; do
  if [ -r $i ]; then
    . $i
  fi
done
unset i

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
