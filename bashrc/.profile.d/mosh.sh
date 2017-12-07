# Bash completions for Mosh, the mobile shell.         -*- shell-script -*-

__mosh_init_completion()
{
    if declare -F _init_completions >/dev/null 2>&1; then
        _init_completion
    else
        COMPREPLY=()
        _get_comp_words_by_ref cur prev words cword
    fi
}

_mosh () {
    local cur

    __mosh_init_completion || return

    local simple_flags="-a -b -4 -6 -p"
    local flags="--client= --server= --predict= --family= --port=
    --bind-server= --ssh= --no-init --help --version"

    if [[ "$cur" == --* && "$COMP_CWORD" == 1 ]]; then
        COMPREPLY=($(compgen -W "$flags" -- "$cur"))
    elif [[ "$cur" == -* && "$COMP_CWORD" == 1 ]]; then
        COMPREPLY=($(compgen -W "$simple_flags" -- "$cur"))
    else
        _known_hosts_real -a "$cur"
    fi
}

complete -o nospace -F _mosh mosh
