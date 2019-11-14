read -p "enter your mongo password:" password
sudo mongo -u Admin --password $password --authenticationDatabase admin << EOF
use Kindle
db.createCollection('Metadata')
db.createCollection('user_data')
db.createCollection('logs')
db.Metadata.createIndex( { asin: 1 } )
EOF
wget -c https://www.dropbox.com/s/zmysok83e8a4vqh/meta_kindle_store.zip?dl=0 -O meta_kindle_store.zip
sudo apt install unzip
unzip meta_kindle_store.zip
rm -rf *.zip
sudo mongoimport -u Admin --password $password --authenticationDatabase admin --legacy -d Kindle -c Metadata < meta_Kindle_Store.json