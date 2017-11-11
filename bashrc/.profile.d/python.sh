use-pyenv() {
	if [[ $LANGVM != *pyenv* ]]; then
		LANGVM+='pyenv '
		export PATH="/home/bubujka/.pyenv/bin:$PATH"
		eval "$(pyenv init -)"
		eval "$(pyenv virtualenv-init -)"
	fi
}

use-venv() {
	if [[ $LANGVM != *venv* ]]; then
		LANGVM+='venv '
		. ./venv/bin/activate
	fi
}

alias p3=python3
alias pd3=pydoc3
alias p3d=pydoc3
