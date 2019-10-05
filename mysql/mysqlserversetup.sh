#!/bin/bash
#sudo apt-get update
sudo apt-get install mysql-server -y
read -p "Allow sql firewall passthrough(y/n)?" PASS
if [ "$PASS" = "y" ] || [ "$PASS" == "Y" ]
then 
    sudo ufw enable 
    sudo ufw allow mysql #allow sql firewall 
fi
sudo systemctl start mysql
read -p "Start server on boot(y/n)?" CONT
if [ "$CONT" = "y" ] || [ "$CONT" == "Y" ]
then 
    echo "server will now start on boot"
    sudo systemctl enable mysql
fi
sudo printf "\n[mysqld]\nbind-address = 0.0.0.0"  >> /etc/mysql/my.cnf #allow external connections
sudo mysql -e 'update mysql.user set plugin = "mysql_native_password" where user="root"'
sudo mysql -e 'create user "root"@"%" identified by ""'
sudo mysql -e 'grant all privileges on *.* to "root"@"%" with grant option'
echo "KEY IN PASSWORD for root"
read password
sudo mysql -e "UPDATE mysql.user SET authentication_string = PASSWORD('$password') WHERE User = 'root';"
sudo mysql -e 'flush privileges'
sudo systemctl restart mysql