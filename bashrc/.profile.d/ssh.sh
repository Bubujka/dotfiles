sa(){
        ssh-agent | grep -v 'echo' > ~/.ssh_agent_info
        source .ssh_agent_info
        ssh-add ~/.ssh/id_rsa
}
source ~/.ssh_agent_info
alias sar='source .ssh_agent_info'

fs() {
  local dir
  dir=$(cat ~/.ssh/config  | grep '^host ' | cut -d' ' -f2 | fzf +m --header="Переход к серверу") && ssh "$dir"
}
