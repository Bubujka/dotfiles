#!/usr/bin/env python3
"""Install configs to system"""
from glob import glob
from subprocess import call
from os.path import isdir, expanduser
import socket
import sys

def hostname():
    """Узнать имя машины, где скрипт запущен"""
    if len(sys.argv) > 1:
        return sys.argv[1]
    return socket.gethostname()

def common_configs():
    """Получить список каталогов общих конфигов"""
    all_configs = [f for f in glob('*') if isdir(f) and not is_overlay_dir(f)]
    overlay = [f.replace('@{}'.format(hostname()), '') for f in overlay_configs()]
    return [f for f in set(all_configs) - set(overlay)]

def overlay_configs():
    """Получить список конфигов что относятся к этому компу"""
    return [f for f in glob("*@{}".format(hostname())) if isdir(f)]

def install_configs(pathes):
    """Установить конфиги с помощью stow"""
    for pth in pathes:
        print("Installing: {}".format(pth))
        call(["stow", "--dotfiles", pth, "-t", expanduser("~/")])

def is_overlay_dir(pth):
    """Является ли каталог оверлеем?"""
    return pth.find('@') > -1

def update_git_submodules():
    """Инициализирует сабмодули конфигов"""
    call('git submodule init'.split(' '))
    call('git submodule update'.split(' '))

if __name__ == '__main__':
    print("Hostname: {}".format(hostname()))
    update_git_submodules()
    install_configs(common_configs())
    install_configs(overlay_configs())
