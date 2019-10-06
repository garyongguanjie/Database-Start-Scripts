wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
read -p "Start server on boot(y/n)?" CONT
if [ "$CONT" = "y" ] || [ "$CONT" == "Y" ]
then 
    echo "server will now start on boot"
    sudo systemctl enable mongod
fi
read -p "Key in password for admin: " password
mongo << EOF
use admin
db.createUser(
    {
        user:"Admin",
        pwd:"$password",
        roles:[
            {
                role:"userAdminAnyDatabase",
                db:"admin"
            },
            "readWriteAnyDatabase"
        ]
    }
)
EOF
sudo printf '\nsecurity:\n  authorization: "enabled"'  >> /etc/mongod.conf
sudo systemctl restart mongod
read -p "Enable firewall passthrough(y/n)?" BOOL
if [ "$BOOL" = "y" ] || [ "$BOOL" == "Y" ]
then 
    echo "UFW enabled open port 27017"
    sudo ufw enable
    sudo ufw allow 27017
fi
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
sudo systemctl restart mongod
sudo systemctl status mongod