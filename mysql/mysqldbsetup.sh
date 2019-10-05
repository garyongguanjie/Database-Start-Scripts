echo "downloading data"
wget -c https://www.dropbox.com/s/wg4y0etqwml0dgg/kindle-reviews.zip?dl=0 -O kindle-reviews.zip
sudo apt install unzip
unzip kindle-reviews.zip
rm -rf kindle_reviews.json
rm -rf *.zip
echo "Following sql commands require sql password"
sudo mysql -e "DROP database if exists Reviews;CREATE database Reviews;" -p
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mysql/setupdb.sql -O setupdb.sql 
sudo mysql -u root -b Reviews < setupdb.sql -p