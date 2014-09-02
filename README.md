Vagransible
===========

Vagransible is an easy way to quickly deploy a virtual machine using Vagrant and Ansible.
Assuming that you are a web developer, there is a LAMP environment set up for you.

Prerequisites
=============

1. Vagrant - https://www.vagrantup.com/
2. Vagrant host manager - https://github.com/smdahlen/vagrant-hostmanager ( vagrant plugin install vagrant-hostmanager )
3. Virtualbox - https://www.virtualbox.org/
4. Ansible - http://docs.ansible.com/intro_installation.html

How to use
==========

1. Clone this repo
2. Go to the root folder and edit settings.yml

Edit basic server info ( name and ip address )

    server:
      hostname: vm-work.box
      ip_address: 172.22.22.22

Set the folders that will share data. ( local is your local folder, and remote is the guest folder)

    syncfolders:
      local: "~/Documents/webroot"
      remote: "/var/www/workprojects"
      
Set the hosts that will be set up on the vm. If you set up remote_mysql_import_file and database_name parameters, the sql file will be imported to the database name you provided, and a cron job will be created that will overwrite the import file with the new data. This was configured so that if you work on a vm and don't want to lose sql data, it will be auto backed up.

    hosts:
      [{ servername: "web1-local.box",
        documentroot: "{{ syncfolders['remote'] }}/web1-local",
        remote_mysql_import_file: "{{ syncfolders['remote'] }}/web1-local/private/sql_to_import.sql",
        database_name: "my_database"},
       { servername: "web2-local.box",
         documentroot: "{{ syncfolders['remote'] }}/web2-local"}]
         
Things to know
==============

  * The provider is Ubuntu trusty64
  * The following packages are installed at vagrant up :
    - curl
    - wget
    - python-software-properties
    - apache2
    - libapache2-mod-php5
    - mysql-server
    - python-mysqldb
    - git
    - memcached
    - php5-mcrypt
    - php5-mysql
    - php5-gd
    - php5-geoip
    - php5-memcached
    - php5-curl
  * The vm will access 1/4 of system memory and all cpu cores on the host
  * A user has been created in mysql for remote access ( mysqlworkbench/sequelpro/etc )
      username:vagrant / password:vagrant

```php
  havefun() && contribute() && !criticize() && give_advice();
```

