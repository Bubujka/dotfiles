use-nvm() {
	if [[ $LANGVM != *nvm* ]]; then
		LANGVM+='nvm '
		export NODE_ENV='development'
		export NVM_DIR="/home/bubujka/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	fi
}


alias nr='npm run'
alias nrc='npm run coverage'

