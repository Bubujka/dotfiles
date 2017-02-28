use-pyenv() {
	if [[ $LANGVM != *pyenv* ]]; then
		LANGVM+='pyenv '
		export PATH="/home/bubujka/.pyenv/bin:$PATH"
		eval "$(pyenv init -)"
		eval "$(pyenv virtualenv-init -)"
	fi
}
