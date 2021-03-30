
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




Структура каталога  проекта, для запуска ansible:

Создадим структуру  для работы ansible, где расположим файлы с переменными и параметрами для подключения:


├── files
├── inventory             <----- Каталог для определения переменных
│   ├── group_vars        <----- Каталог для хранения групповых переменных
│   │   ├── dev.yml
│   │   └── prod.yml
│   ├── host_vars
│   │   ├── prod-nginx-01.yml
│   │   └── prod-nginx-02.yml
│   ├── prod
│   │   └── prod.yml
│   └── staging
│       └── stage.yml
├── playbooks             <----- Каталог для хранения playbooks
│   ├── nginx.retry
│   └── nginx.yml
├── roles                 <----- Каталог для хранения roles
└── templates


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

<details>
             <summary>ansible.cfg в директории проекта</summary>

Файл расположим в корневой папке, где находится и Vagrantfile

    [defaults]
    inventory = ansible/inventory
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

</details>

- $ ansible-inventory --graph     <---- Отображение и проверка струтуры inventory.

      @all:
      |--@dev:
      |  |--prod-comp
      |--@prod:
      |  |--admin-comp
      |--@test:
      |--@ungrouped:



Скопируем ssh ключ с prod_server сервера, после первого запуска vagrant-a, на admin-comp для дальнейшего управленя через ansible
prod_server:

scp -v -i ./private_key -P 2200 -o StrictHostKeyChecking=no  .vagrant/machines/prod_server/virtualbox/private_key  vagrant@127.0.0.1 /vagrant


##         

#       1.2 Общая теория, примеры, полезности.


##    .1 Программы для управления и запуска ansible

<details>
             <summary>Команды просмотра и управления inventory</summary>


<details>
             <summary> Inventory "--graph"</summary>  

1.   $ ansible-inventory --graph     <---- Отображение и проверка струтуры inventory для всех параметров в графическом виде .

            @all:
            |--@dev:
            |  |--prod-comp
            |--@prod:
            |  |--admin-comp
            |--@test:
            |--@ungrouped:

</details>

___

<details>
             <summary> Inventory "--list"</summary>

2.  $ ansible-inventory --list        <---- Отображение и проверка inventory в виде структуры.

      {
          "_meta": {
              "hostvars": {
                  "admin-comp": {
                      "ansible_host": "192.168.50.10",
                      "ansible_port": 22,
                      "ansible_private_key_file": "/installs/Study/OTUS/lesson_15_ANSIBLE_2/homework_lesson15_ANSIBLE_staging/.vagrant/machines/prod-nginx-01/virtualbox/private_key",
                      "ansible_user": "vagrant",
                      "test_var": "test_var_group"
                  },
                  "prod-comp": {
                      "ansible_host": "192.168.50.11",
                      "ansible_port": 22,
                      "ansible_private_key_file": "./private_key",
                      "ansible_user": "vagrant"
                   .......
                   .......
                   .......
            }
</details>

___

<details>
             <summary> Inventory "--graph --vars"</summary>

3.  $ ansible-inventory prod --graph --vars         <---- Отображение и проверка переменных группы prod  в inventory

            @prod:
            |--prod-nginx-01
            |  |--{ansible_host = 127.0.0.1}
            |  |--{ansible_port = 2222}
            |  |--{ansible_private_key_file = /installs/Study/OTUS/lesson_15_ANSIBLE_2/homework_lesson15_ANSIBLE_staging/.vagrant/machines/prod-nginx-01/virtualbox/private_key}
            |  |--{ansible_user = vagrant}
            |--prod-nginx-02
            |  |--{ansible_host = 127.0.0.1}
            |  |--{ansible_port = 2200}
            |  |--{ansible_private_key_file = /installs/Study/OTUS/lesson_15_ANSIBLE_2/homework_lesson15_ANSIBLE_staging/.vagrant/machines/prod-nginx-02/virtualbox/private_key}
            |  |--{ansible_user = vagrant}

</details>
</details>

___


> Пример запуска в ansible команды на удалённых компах, с использованием модуля -m command  в однострочном варианте (Ad-hoc):

*  [andrey@SrvHomeAMD repo_1_nginx]$ ansible all -i inventory/prod/ -m command -a "uname -r"

        prod-nginx-01 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
        prod-nginx-02 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
