# Считать все файлы в каталоге ~/.profile.d/

for i in ~/.profile.d/*.sh; do
  if [ -r $i ]; then
    #echo $i	$(date +%s%N)
    . $i
  fi
done
unset i

export ANDROID_HOME="/home/bubujka/Android/Sdk"
export ANDROID_PLATFORM_TOOLS="/home/bubujka/Android/Sdk/platform-tools"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH=/opt/java8/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:/opt/gradle/bin:$PATH


