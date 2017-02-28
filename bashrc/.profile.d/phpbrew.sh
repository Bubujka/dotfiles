use-phpbrew() {
	if [[ $LANGVM != *phpbrew* ]]; then
		LANGVM+='phpbrew '
		export PHPBREW_SET_PROMPT=1
		export PHPBREW_RC_ENABLE=1
		[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
	fi
}
