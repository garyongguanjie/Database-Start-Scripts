echo "downloading data"
wget -c https://istd50043.s3-ap-southeast-1.amazonaws.com/kindle-reviews.zip -O kindle-reviews.zip
EXIT_STATUS=1
while [ "$EXIT_STATUS" -ne "0" ]
do
    sudo apt install unzip
    EXIT_STATUS=$?
done
unzip kindle-reviews.zip
rm -rf kindle_reviews.json
rm -rf *.zip
sudo mysql -e "DROP database if exists Reviews;CREATE database Reviews;"
wget -c https://raw.githubusercontent.com/garyongguanjie/Database-Start-Scripts/master/mysql/setupdb.sql -O setupdb.sql 
sudo mysql -u root -b Reviews < setupdb.sql