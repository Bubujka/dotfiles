#eval "$(gpg-agent --daemon)"
# # Запуск и подключение gpg-agent - чтобы по сотне раз не вводить пароль к почте
# envfile="$HOME/.gnupg/gpg-agent.env"
# if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#     eval "$(cat "$envfile")"
# else
# fi
# export GPG_AGENT_INFO  # the env file does not contain the export statement
