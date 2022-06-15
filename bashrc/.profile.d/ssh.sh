sa(){
        ssh-agent | grep -v 'echo' > ~/.ssh_agent_info
        source .ssh_agent_info

        ssh-add $(ls ~/.ssh/id_rsa* | grep -v pub)
}
source ~/.ssh_agent_info
alias sar='source .ssh_agent_info'

fs() {
  local dir
  if [ $# -eq "0" ] ; then
	  dir=$(cat ~/.ssh/config  | grep '^host ' | cut -d' ' -f2 | fzf +m --header="Переход к серверу") && set_xterm_title "xterm SSH to $dir" && ssh "$dir" ; set_xterm_title "xterm"
  else
	  dir=$(cat ~/.ssh/config  | grep '^host ' | grep "$1" | cut -d' ' -f2 | fzf +m --header="Переход к серверу") && set_xterm_title "xterm SSH to $dir" && ssh "$dir"; set_xterm_title "xterm"
  fi
}
