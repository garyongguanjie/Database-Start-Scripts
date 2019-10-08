# Database-Start-Scripts
Automated scripts to start databases

Note:
When running locally highly recommended to run it on a virtual machine.

Set up on any ubuntu machine and in settings of VirtualBox change your vm settings to : Networks - > Bridge Adapter

This will give your vm an ip address and you can connect to it directly.
## mysql
* mysqlserversetup.sh   
  This sets up the database server, opens up the ports for external usage(optional prompt) and starts mysql on boot(optional prompt).
* mysqldbsetup.sh   
  This sets up the database and loads the csv file automatically into the database.

How to run:
```
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mysql/mysqlserversetup.sh -O mysqlserversetup.sh
sudo bash mysqlserversetup.sh
```
```
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mysql/mysqldbsetup.sh -O mysqldbsetup.sh
sudo bash mysqldbsetup.sh
```

To login:
```
sudo mysql -u root -p
```
## mongodb
* mongodbserver.sh   
  This sets up the database server, opens up the ports for external usage(optional prompt) and starts mongodb on boot(optional prompt).
* mongodbsetup.sh   
  This sets up the database and loads the csv file automatically into the database.
How to run:
```
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mongodb/mongodbserver.sh -O mongodbserver.sh
sudo bash mongodbserver.sh
```
```
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mongodb/mongodbsetup.sh -O mongodbsetup.sh
sudo bash mongodbsetup.sh
```

To login:
```
sudo mongo -u Admin -p --authenticationDatabase admin
```