
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

**_Для запуска задачи, необходимо выполнить "start.sh" в рабочем каталоге_**

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



Скопируем ssh ключ с prod_server сервера, после первого запуска vagrant-a, на admin-comp для дальнейшего управленя через ansible
prod_server:

scp -v -i ./private_key -P 2200 -o StrictHostKeyChecking=no  .vagrant/machines/prod_server/virtualbox/private_key  vagrant@127.0.0.1 /vagrant


##         

#       1.2 Общая теория, примеры, полезности.

-   **Tags**  - Позволяют запустить (или исключить запуск) часть конфигурации без необходимости запуска всего playbook.   Тегировать можно как plays так и tasks. Для каждого элемента может бытьболее одной метки.

    **Пример:**

        _Задача по установке nginx, тегируем двумя метками nginx-package и packages**_

        -  name: Install packages nginx
        yum:
            name: nginx
            state: present
        tags:
            - nginx-package
            - packages

    _$ ansible-playbook prod-server.yml --tags "nginx-package" <--- Запускаем выполнение задачи тегированной тегом "nginx-package", будет выполнена только эта задача. Если несколько задач затегированны одним тегом, то они все будут выполнены_

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

   _Просмотр существующих тегов.Прокажет все задачи (Tasks) и теги для каждой задачи_

   **Пример:**

          ansible-playbook prod-server.yml --list-tasks


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

</details>

___

<details>
             <summary> Inventory "--graph --vars"</summary>

3.  $ ansible-inventory prod --graph --vars         <---- Отображение и проверка переменных группы prod  в inventory

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


 Пример запуска в ansible команды на удалённых компах, с использованием модуля -m command  в однострочном варианте (Ad-hoc):

*  [andrey@SrvHomeAMD repo_1_nginx]$ ansible all -i inventory/ansible/ -m command -a "uname -r"

        prod-nginx-01 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
        prod-nginx-02 | CHANGED | rc=0 >>
        3.10.0-862.2.3.el7.x86_64
