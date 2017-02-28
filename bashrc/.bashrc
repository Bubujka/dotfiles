# Считать все файлы в каталоге ~/.profile.d/

for i in ~/.profile.d/*.sh; do
  if [ -r $i ]; then
    #echo $i	$(date +%s%N)
    . $i
  fi
done
unset i
