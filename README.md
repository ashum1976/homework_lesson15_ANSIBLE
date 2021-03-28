
#         1. Управление конфигурациями. Ansible.
##      1.1 Домашнее задание
Подготовить стенд на Vagrant. На этом сервере используя Ansible необходимо развернуть nginx со следующими
условиями:
 - необходимо использовать модуль yum
 - конфигурационные файлы должны быть взяты из шаблона jinja2 с переменными
 - после установки nginx должен быть в режиме enabled в systemd
 - должен быть использован notify для старта nginx после установки
 - сайт должен слушать на нестандартном порту - 8080, для этого использовать переменные в Ansible



###      1.1.1 Подготовка inventory
Для выполнения ДЗ подготовим inventory, в котором опишем 2 продакшен сервера, один тестовый сервер. Описание будем делать в yaml формате.

 1. [andrey@SrvHomeAMD repo_1_nginx]$ ansible all -i inventory/prod/ -m command -a "uname -r"

        prod-nginx-01 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
        prod-nginx-02 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
 
 2. TEst     



#       2. Общая теория, примеры, полезности.

Структура каталога  проекта, для запуска ansible:
В начальной папке проектов /installs/GitHub/ansible/ создаёмновую папку для нашего проекта repo_1_nginx
со следующей структурой:

        ├── ansible.cfg    <---- Конфигурационный файл ansible, в котором определим общие значения переменных для текущего проекта. Так же можно определить значения переменных и в файле /etc/ansible/ansible.config
        ├── inventory
        │   ├── prod
        │   │   ├── all.yml
        │   │   ├── group_vars
        │   │   │   └── prod.yml
        │   │   └── host_vars
        │   │       └── prod-nginx-01.yml
        │   └── staging
        │       ├── all.yml
        │       ├── group_vars
        │       │   └── dev.yml
        │       └── host_vars
        │           └── prod-nginx-02.yml
        ├── playbooks
        └── roles

<detail>
             <summary>ansible.cfg в директории проекта</summary>

    [defaults]
    transport = smart
    roles_path = ./roles
    remote_user = vagrant
    host_key_checking = False
    retry_files_enabled = True
    log_path = /var/log/ansible.log
    display_args_to_stdout = True

    [diff]
    # Always print diff when running ( same as always running with -D/--diff )
    always = yes
    # Set how many context lines to show in diff
    context = 3
</detail>

##    2.1
