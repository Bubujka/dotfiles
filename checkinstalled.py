#!/usr/bin/env python3
"""Проверить что в системе установлено всё что мне нужно для работы"""

from subprocess import check_output, CalledProcessError

def installed(command):
    """Проверить что данная команда есть в системе"""
    try:
        check_output(['which', command])
        return True
    except CalledProcessError:
        return False


def domagic():
    """Сделать магию"""
    with open('programs.txt') as tfile:
        not_installed = ["- "+f for f in tfile.readlines() if not installed(f.strip())]
        if len(not_installed):
            print("Нужно доустановить: \n", "".join(not_installed))
            exit(1)
        else:
            print("Всё что нужно - установлено")


if __name__ == '__main__':
    domagic()
