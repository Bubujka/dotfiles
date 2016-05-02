# Считать все файлы в каталоге ~/.profile.d/
for i in ~/.profile.d/*.sh; do
  if [ -r $i ]; then
    . $i
  fi
done
unset i
