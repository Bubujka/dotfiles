# Считать все файлы в каталоге ~/.profile.d/

for i in ~/.profile.d/*.sh; do
  if [ -r "$i" ]; then
    # Раскомментируй строку для бенчмаркинга
    # echo $i	$(date +%s%N)
    . "$i"
  fi
done
unset i

PATH="/home/bubujka/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/bubujka/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/bubujka/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/bubujka/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/bubujka/perl5"; export PERL_MM_OPT;
