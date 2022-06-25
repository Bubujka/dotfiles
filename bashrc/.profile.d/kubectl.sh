source <(kubectl completion bash)
complete -o default -F __start_kubectl k

kfs() {
  local dir
  unset DEBUG;

  if [ $# -eq "0" ] ; then
    dir=$(kubectl get pods -n stage --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Переход к серверу") && kubectl exec -n stage --stdin --tty "$dir" -- /bin/bash
  else
    dir=$(kubectl get pods -n "$1" --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Переход к серверу") && kubectl exec -n "$1" --stdin --tty "$dir" -- /bin/bash
  fi
}

kfsn() {
  local dir
  unset DEBUG;

  ns=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Выбор нэймспэйса в кубере")
  dir=$(kubectl get pods -n "$ns" --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Переход к поду в нэймспэйсе $ns") && kubectl exec -n "$ns" --stdin --tty "$dir" -- /bin/bash
}

klogs() {
  local dir
  unset DEBUG;

  dir=$(kubectl get pods -n stage --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Переход к серверу") && kubectl logs -f -n stage "$dir"

  echo "Для просмотра логов можно использовать команду:"
  echo "kubectl logs -f -n \"stage\" \"$dir\""
}

klogsn() {
  local dir
  unset DEBUG;

  ns=$(kubectl get ns --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Выбор нэймспэйса в кубере")
  dir=$(kubectl get pods -n "$ns" --no-headers -o custom-columns=":metadata.name" | fzf +m --header="Просмотр логов") && kubectl logs -f -n "$ns" "$dir"

  echo -e "\n\n\nДля просмотра логов можно использовать команду:"
  echo "kubectl logs -f -n \"$ns\" \"$dir\""

}
