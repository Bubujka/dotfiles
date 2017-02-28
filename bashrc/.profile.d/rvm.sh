use-rvm() {
	if [[ $LANGVM != *rvm* ]]; then
		LANGVM+='rvm '
		[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
	fi
}
