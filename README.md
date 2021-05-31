
#         1. Управление конфигурациями. Ansible.
##      1.1 Домашнее задание
Подготовить стенд на Vagrant. На этом сервере используя Ansible необходимо развернуть nginx со следующими
условиями:
 - необходимо использовать модуль yum
 - конфигурационные файлы должны быть взяты из шаблона jinja2 с переменными
 - после установки nginx должен быть в режиме enabled в systemd
 - должен быть использован notify для старта nginx после установки
 - сайт должен слушать на нестандартном порту - 8080, для этого использовать переменные в Ansible

___

В рабочем каталоге должны лежать файлы и каталоги из ссылки на GitHub-е :
[Ansible описание/полезности, ДЗ. ](https://github.com/ashum1976/homework_lesson15_ANSIBLE)

1. Файл - Vagrantfile
2. Файл - ansible.cp_nginx_cfg
3. Файл - prod-serve.yaml
4. Каталог - ansible

**На компьютере должен быть установлен ansible !!!!**
**При запуске создаётся приватная сеть с доступом с хостовой машины 192.168.50.0/24**

**_Для запуска задачи, необходимо выполнить "vagrant up" в рабочем каталоге_**

**_Проверка, что всё отработало, успешное выполнение команды:_**

    curl http://192.168.50.10:8080

<details>

<summary>Вывод успешного выполнения команды curl</summary>  


                        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
            <html>
            <head>
            <title>Welcome to CentOS</title>
            <style rel="stylesheet" type="text/css">

                    html {
                    background-image:url(img/html-background.png);
                    background-color: white;
                    font-family: "DejaVu Sans", "Liberation Sans", sans-serif;
                    font-size: 0.85em;
                    line-height: 1.25em;
                    margin: 0 4% 0 4%;
                    }

                    body {
                    border: 10px solid #fff;
                    margin:0;
                    padding:0;
                    background: #fff;
                    }

                    /* Links */

                    a:link { border-bottom: 1px dotted #ccc; text-decoration: none; color: #204d92; }
                    a:hover { border-bottom:1px dotted #ccc; text-decoration: underline; color: green; }
                    a:active {  border-bottom:1px dotted #ccc; text-decoration: underline; color: #204d92; }
                    a:visited { border-bottom:1px dotted #ccc; text-decoration: none; color: #204d92; }
                    a:visited:hover { border-bottom:1px dotted #ccc; text-decoration: underline; color: green; }

                    .logo a:link,
                    .logo a:hover,
                    .logo a:visited { border-bottom: none; }

                    .mainlinks a:link { border-bottom: 1px dotted #ddd; text-decoration: none; color: #eee; }
                    .mainlinks a:hover { border-bottom:1px dotted #ddd; text-decoration: underline; color: white; }
                    .mainlinks a:active { border-bottom:1px dotted #ddd; text-decoration: underline; color: white; }
                    .mainlinks a:visited { border-bottom:1px dotted #ddd; text-decoration: none; color: white; }
                    .mainlinks a:visited:hover { border-bottom:1px dotted #ddd; text-decoration: underline; color: white; }

                    /* User interface styles */

                    #header {
                    margin:0;
                    padding: 0.5em;
                    background: #204D8C url(img/header-background.png);
                    text-align: left;
                    }

                    .logo {
                    padding: 0;
                    /* For text only logo */
                    font-size: 1.4em;
                    line-height: 1em;
                    font-weight: bold;
                    }

                    .logo img {
                    vertical-align: middle;
                    padding-right: 1em;
                    }

                    .logo a {
                    color: #fff;
                    text-decoration: none;
                    }

                    p {
                    line-height:1.5em;
                    }

                    h1 {
                            margin-bottom: 0;
                            line-height: 1.9em; }
                    h2 {
                            margin-top: 0;
                            line-height: 1.7em; }

                    #content {
                    clear:both;
                    padding-left: 30px;
                    padding-right: 30px;
                    padding-bottom: 30px;
                    border-bottom: 5px solid #eee;
                    }

                .mainlinks {
                    float: right;
                    margin-top: 0.5em;
                    text-align: right;
                }

                ul.mainlinks > li {
                border-right: 1px dotted #ddd;
                padding-right: 10px;
                padding-left: 10px;
                display: inline;
                list-style: none;
                }

                ul.mainlinks > li.last,
                ul.mainlinks > li.first {
                border-right: none;
                }

            </style>

            </head>

            <body>

            <div id="header">

                <ul class="mainlinks">
                    <li> <a href="http://www.centos.org/">Home</a> </li>
                    <li> <a href="http://wiki.centos.org/">Wiki</a> </li>
                    <li> <a href="http://wiki.centos.org/GettingHelp/ListInfo">Mailing Lists</a></li>
                    <li> <a href="http://www.centos.org/download/mirrors/">Mirror List</a></li>
                    <li> <a href="http://wiki.centos.org/irc">IRC</a></li>
                    <li> <a href="https://www.centos.org/forums/">Forums</a></li>
                    <li> <a href="http://bugs.centos.org/">Bugs</a> </li>
                    <li class="last"> <a href="http://wiki.centos.org/Donate">Donate</a></li>
                </ul>

                    <div class="logo">
                            <a href="http://www.centos.org/"><img src="img/centos-logo.png" border="0"></a>
                    </div>

            </div>

            <div id="content">

                    <h1>Welcome to CentOS</h1>

                    <h2>The Community ENTerprise Operating System</h2>

                    <p><a href="http://www.centos.org/">CentOS</a> is an Enterprise-class Linux Distribution derived from sources freely provided
            to the public by Red Hat, Inc. for Red Hat Enterprise Linux.  CentOS conforms fully with the upstream vendors
            redistribution policy and aims to be functionally compatible. (CentOS mainly changes packages to remove upstream vendor
            branding and artwork.)</p>

                    <p>CentOS is developed by a small but growing team of core
            developers.&nbsp; In turn the core developers are supported by an active user community
            including system administrators, network administrators, enterprise users, managers, core Linux contributors and Linux enthusiasts from around the world.</p>

                    <p>CentOS has numerous advantages including: an active and growing user community, quickly rebuilt, tested, and QA'ed errata packages, an extensive <a href="http://www.centos.org/download/mirrors/">mirror network</a>, developers who are contactable and responsive, Special Interest Groups (<a href="http://wiki.centos.org/SpecialInterestGroup/">SIGs</a>) to add functionality to the core CentOS distribution, and multiple community support avenues including a <a href="http://wiki.centos.org/">wiki</a>, <a
            href="http://wiki.centos.org/irc">IRC Chat</a>, <a href="http://wiki.centos.org/GettingHelp/ListInfo">Email Lists</a>, <a href="https://www.centos.org/forums/">Forums</a>, <a href="http://bugs.centos.org/">Bugs Database</a>, and an <a
            href="http://wiki.centos.org/FAQ/">FAQ</a>.</p>

                    </div>

            </div>


            </body>
            </html>

</details>

___


###      1.1.1 Подготовка inventory

Для выполнения ДЗ подготовим inventory, в котором опишем 2 продакшен сервера, один тестовый сервер. Описание будем делать в yaml формате.

Структура каталога  проекта, для запуска ansible:

Создадим структуру  для работы ansible, где расположим файлы с переменными и параметрами для подключения:


    ├── files
    ├── inventory             <---- Каталог для определения переменных
    │   ├── group_vars    <---- Каталог для хранения групповых переменных применяются к группе, по имени файла ( prod.yml - группа)
    │   │   ├── dev.yml
    │   │   └── prod.yml
    │   ├── host_vars        <----- Каталог для хранения, переменных применяемых к хостам, по имени файл (adm_comp.yml )
    │   │   └── adm_comp.yml
    │   ├── prod
    │   │   └── prod.yml
    │   └── staging
    │       └── stage.yml
    ├── playbooks             <----- Каталог для хранения playbooks
    │   └── prod-server.yml
    ├── roles                 <----- Каталог для хранения roles
    └── templates
        └── nginx.conf.j2

<details>
             <summary>ansible.cfg в директории проекта</summary>
Файл расположим в корневой папке, где находится и Vagrantfile

    [defaults]
    inventory = ansible/inventory
    transport = smart
    roles_path = ../roles
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



**Для успешного запуска с локального хоста vagrant  стенда, необходимо правильно определить параметры в секции  prod.vm.provision**

> параметры подключения находятся в каталоге (относительно папки проекта) "ansible/inventory". В файле прописана группа dev, в ней и описываются хосты.
>

Секция provision Vagrantfile:

        prod.vm.provision "ansible" do |ansible|
                          ansible.verbose = "vv"
                          ansible.limit = "all"    <---- Если используем группы, то указываем это значение "all", по умолчанию vagrant запускает со значением имени виртуальной машины "-limit=prod_server"
                          ansible.inventory_path = "./ansible/inventory/"  <---- Указать папку с нашим inventory, по умолчанию vagrant указывает свою локальную папку "--inventory-file=/полный путь от корня бла/ бла/ бла /.vagrant/provisioners/ansible/inventory"
                          ansible.playbook = "prod-server.yml"
                        end

Скопируем ssh ключ с prod_server сервера, после первого запуска vagrant-a, на admin-comp для дальнейшего управленя через ansible
prod_server:

scp -v -i ./private_key -P 2200 -o StrictHostKeyChecking=no  .vagrant/machines/prod_server/virtualbox/private_key  vagrant@127.0.0.1 /vagrant


##         

#       1.2 Общая теория, примеры, полезности.

##    1.2.1 Ansible.cfg

Файл в ini формате в котором хранятся предопределенные параметры, например:

        inventory = ansible/inventory
        transport = smart
        roles_path = ./roles
        remote_user = vagrant
        host_key_checking = False
        log_path = ./ansible.log

##    1.2.2 Ansible. Inventory

Группировка и разделение хостов

- Вложенные группы
- Inventory файлов может быть несколько
- Динамический Inventory
- Позволяет переопределить параметры указанные в ansible.cfg
- Групповые переменные и переменные хостов

Пример структуры каталога Inventory:
<details>
             <summary>Структура каталога Invrntory</summary>

          ├── files
          ├── inventory             <---- Каталог для определения переменных
          │   ├── group_vars    <---- Каталог для хранения групповых переменных применяются к группе, по имени файла ( prod.yml - группа)
          │   │   ├── dev.yml
          │   │   └── prod.yml
          │   ├── host_vars        <----- Каталог для хранения, переменных применяемых к хостам, по имени файл (adm_comp.yml )
          │   │   └── adm_comp.yml
          │   ├── prod
          │   │   └── prod.yml
          │   └── staging
          │       └── stage.yml
          ├── playbooks             <----- Каталог для хранения playbooks
          │   └── prod-server.yml
          ├── roles                 <----- Каталог для хранения roles
          └── templates
              └── nginx.conf.j2

</details>

Формат файла в Inventory(YAML)

<details>
             <summary>YAML формат файлов в Inventory  </summary>

          all:
            children:
              prod:
          #    dev:
            vars:
              ansible_user: 'vagrant'
              ansible_host: 127.0.0.1

          prod:
          #dev:
            hosts:
              adm_comp:
                #ansible_host: 192.168.50.10
                ansible_port: 2200
                ansible_private_key_file: .vagrant/machines/adm_comp/virtualbox/private_key

</details>

##      1.2.3 Ansible. Модули

**ОСНОВА ДЛЯ ВЫПОЛНЕНИЯ ЗАДАЧ В ANSIBLE !!!!**

Библиотеки для выполнения и отслеживания состояния задач. По сути код который формирует другой код который выполняется на удаленной
машине:
- Типовые операции ОС
- Управление ресурсами
- Все остальное

Пример использования модуля:

  yum:  
    name: epel-release  <---- _**параметр модуля (в данном случае имя пакета для установки)**_

##### Разные модули с примерами использования

  - **lineinfile**     Модуль работы со строками в файле


Модуль lineinfile позволяет управлять отдельными строками в существующих файлах. Полезно обновлять целевую конфигурацию в существующих файлах без изменения остальной части файла или копирования всего файла конфигурации.

Например, добавьте новую запись в файл хостов следующим образом:

    - name: Ensure host rh8-vm03 in hosts file
      lineinfile:
        path: /etc/hosts
        line: 192.168.122.236 rh8-vm03
        state: present
Также можно использовать этот модуль для изменения существующей строки, применив параметр regexpдля поиска существующей строки для замены. Например, обновить sshd_configфайл, чтобы предотвратить вход в систему с правами root, изменив строку "**PermitRootLogin yes**" на "**PermitRootLogin no**":

    - name: Ensure root cannot login via ssh
      lineinfile:
        path: /etc/ssh/sshd_config
        regexp: '^PermitRootLogin'
        line: PermitRootLogin no
        state: present

     >Устаревший вариант записи
     lineinfile: dest=/etc/ssh/sshd_config regexp='^#?AuthenticationMethods' line='AuthenticationMethods publickey'
     lineinfile: dest=/etc/ssh/sshd_config regexp='^#?PasswordAuthentication' line='PasswordAuthentication no'
     lineinfile: dest=/etc/ssh/sshd_config regexp='^#?ChallengeResponseAuthentication' line='ChallengeResponseAuthentication no'
     lineinfile: dest=/etc/ssh/sshd_config regexp='^#?PubkeyAuthentication' line='PubkeyAuthentication yes'   

     **Описание параметров модуля:**
      dest=   путь к файлу
      regexp= регулярное выражение
      line=  на что заменить строку из регулярки

  - **file**      Модуль работы с файлами

      file:
        dest: /etc/ssh/ssh_host_ecdsa_key.pub
        state: absent                                <----- удалить файл
      file:
        dest: /etc/ssh/ssh_host_ecdsa_key
        state: absent
    **Описание параметров модуля:**
        dest:   путь для создания файла
        state:
          - absent (удалить)
          - touch (создать)
              mode: 0755             <--- или
              mode: u=rwx,g=rx,o=rx  <--- или
              owner: test
          - directory (создать директорию)
          -
  - **copy**  Модуль работы с фалом, создать файл с содержимым

    - name: Creating a file with content
      copy:
        dest: "/your path"
        content: |      
          line 01
          line 02
    **Описание параметров модуля:**
        contetnt:  содержимое файла
        dest:   путь для создания файла

  - **service**       Модуль управления сервисами демонами службами (systemd)

      service:
        name: "apache2"
        state: started                  <---- Статус "запущен" т.е systemd стартанёт эту службу
        enabled: yes                    <---- И включен
    **Описание параметров модуля:**
        state: started   (Статус "запущен" т.е systemd стартанёт эту службу)
        enabled: yes (сервис будет включен)

  - **user**           Модуль управления пользователем в ОС (создание, настройка)            
    - name:   Создание пользователя
      user:
        name: obender
        state: present    <---- Создать пользователя, статус "существует"
        password: "{{ 'SuperScretPasswd' | password_hash('sha512') }}"
        update_password: on_create
        shell: /bin/bash

    **Описание параметров модуля:**
        name: obender (имя пользователя)
        state:
          - present (Создать пользователя, статус "существует")
        password: "{{ 'SuperScretPasswd' | password_hash('sha512') }}"



[СПИСОК МОДУЛЕЙ ИЗ ДОКУМЕНТАЦИИ](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)

##      1.2.4 Ansible. Переменные

Могут использоваться почти везде, в пределах инфраструктурного
репозитория. Переменные можно задавать по ходу выполнения play (set_facts, register)

- Для переиспользования и определения отличий
- Дополняют циклы и операторы условиями

YAML поддерживает словари и списки.

        -name: Test
         gather_facts: True
         hosts:
            - dev
            - prod
         vars:                  <--- переменные
            nginx_user: nginx     
            nginx_port: 8080      
            ngins_workers: {{ ansible_processor_core}} <---Ссылка на другую переменную, полученную в результате выполнения  gather_facts: True (сбор параметров с удалённого компа)

Список переменных выглядит так:

      redhat_packges:
            - tree
            - mc
            - bin-utils


Словарь:

test_user:
  - name: 'ptrov'
    dest: '/home/petrov'
  - name: 'Ivanov'
    dest: '/home/ivanov'


##    1.2.5 Ansible. Колекции дополнительных модулей

    [Ansible 2.10 (Русский)](https://runebook.dev/ru/docs/ansible/-index-) <---- Наборы коллекция плагинов и модулей для Ansible

###   1.2.5.1

      [Коллекции community.general](https://galaxy.ansible.com/community/general)
          В этой  коллекции есть плагин управления сетевыми устройствами:
            - **community.general.nmcli - Управление сетью**

          Пример подключения дополнительной коллекции в Vagran-те, модуля Ansible в секции првижинга:

                  # box.vm.provision "ansible_local" do |ansible|
                  **#Установка  коллекции community.general, для использования community.general.nmcli (nmcli) управление сетевыми устройствами.**
                      **ansible.galaxy_command = 'ansible-galaxy collection install community.general'**
                  #   ansible.verbose = "vv"
                  #   ansible.install = "true"
                  #   ansible.limit = "all"
                  #   ansible.inventory_path = "./ansible/inventory/"
                  #   ansible.playbook = "./ansible/playbooks/routers.yml"
                  # end


##      1.2. Playbooks

Playbooks - Сценарии для достижения целевого состояния системы с использованием модулей Ansible.

- Установка и настройка ПО
- Деплой
- Управление внешними сервисами





##        1.2.3 Roles

Role - это директория с определенной структурой и файлами внутри нее.

Роль состоит из:
* Таксов и хендлеров
* Переменных
* Метаданных
* Тестов
* Вспомогательных файлов
* Шаблонов

Инициализировать древо каталогов можно одной командой:

        $ ansible-galaxy init mysql-role

Структура каталга роли:

            defaults/  <----                 Дефолтные переменные
            files/     <----           Вспомогательные файлы
            handlers/  <----         Обработчики
            meta/      <----        Метаданные
            tasks/     <----          Таски
            templates/ <----            Шаблоны
            test/      <----              Данные для тестов
            vars/      <----                Переменные с более высоким приоритетом, чем defaults



Ansible. Requirements.yml

Зависимости необходимые вашей роли или всему репозиторию:

[root@ansible ~]$ ansible-galaxy install -r requirements.yml     <---- Скачается роль (role_name), той версии (version 1.1.2)  которая указана в файле. Вариант версионирования ролей. Скачиваться буде в каталог, если указан в файле ansible.cfg "roles_path = ./roles", иначе по дефолтному пути в домашний каталог.

    -src: http://github.com/blablabla/role_name
     version 1.1.2

###       1.2.3.1 Tags

-   **Tags**  - Позволяют запустить (или исключить запуск) часть конфигурации без необходимости запуска всего playbook.   Тегировать можно как plays так и tasks. Для каждого элемента может быть более одной метки.

    **Пример:**

        Задача по установке nginx, тегируем двумя метками: nginx-package и packages

     -  name: Install packages nginx
        yum:
            name: nginx
            state: present
        tags:
            - nginx-package
            - packages

        $ ansible-playbook prod-server.yml --tags "nginx-package" <--- Запускаем выполнение задачи тегированной тегом "nginx-package", будет выполнена только эта задача. Если несколько задач затегированны одним тегом, то они все будут выполнены

    **Пример:**

      - name: 'Install repository'
        yum:
          name: epel-release
          state: present
        tags:
          - epel-package   
          - packages      <---- Тег для задачи 'Install repository'

      - name: Install packages nginx
        yum:
          name: nginx
          state: present
        tags:
          - nginx-package
          - packages     <---- Тег для задачи Install packages nginx

  Просмотр существующих тегов.Прокажет все задачи (Tasks) и теги для каждой задачи

   **Пример:**

          ansible-playbook prod-server.yml --list-tasks


###       1.2.3.1 Handlers

- Handlers (обработчики) - это специальные задачи. Они вызываются из других задач ключевым словом notify. Эти задачи срабатывают после выполнения  всех   задач в сценарии (play). При этом, если несколько задач вызвали одну и ту же задачу через notify, **она выполнится только один раз**.
Handlers описываются в своем подразделе playbook - handlers, так же, как и задачи. Для них используется такой же синтаксис, как и для задач. В основном используются для перезапуска рестатра сервиса через systemd

Принудительное выполнение хендлера возможно при помощи модуля:

    meta: flush_handlers

Пример Handler:

          handlers:
            - name: reload service    <---- Имя Handlers
              systemd:
                name: nginx
                state: reload
          task:
            - name: Test task
                template:
                  src: blablabla
                  dst: blablabla
              notify:
                - reload service      <---- Должно совпадать с именем handlers


#         1.3 Команды выполнения в tasks


##        1.3.1 Циклы


- Пример задания массива значений:

      ssh_super_team:
          /- { user: ‘pupkin’, key: ‘ssh-rsa pupkin_pub_key’, shell: ‘/bin/zsh’}
          /- { user: ‘oldfag’, key: ‘ssh-rsa oldfag_pub_key’, shell: ‘/bin/sh’ }

- Пример получения значений из объявленного массива, неявный цикл, значения вычитываются все из массива.

      /- name: Add BestAdminsTeam
        user: name={{ item.user }} shell={{ item.shell }} groups=’sudo’
        with_items:
            /- $ssh_super_team





##    1.4. Программы для управления и запуска ansible

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

</details>

___

<details>
             <summary> Inventory "--graph --vars"</summary>

3.  $ ansible-inventory prod --graph --vars         <---- Отображение и проверка переменных группы prod  в inventory, для всех переменных используется группа "all"

      @prod:
        |--adm_comp
        |  |--{ansible_host = 127.0.0.1}
        |  |--{ansible_port = 2200}
        |  |--{ansible_private_key_file = .vagrant/machines/adm_comp/virtualbox/private_key}
        |  |--{ansible_user = vagrant}
        |  |--{test_var = test_var_group}
        |--{test_var = test_var_group}

</details>
</details>

___

AD-HOC

Пример запуска в ansible команды на удалённых компах, с использованием модуля -m command  в однострочном варианте (Ad-hoc):

*  [andrey@SrvHomeAMD repo_1_nginx]$ ansible all -i inventory/ansible/ -m command -a "uname -r"

        prod-nginx-01 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
        prod-nginx-02 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
