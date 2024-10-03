#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl enable apache2
echo "<html>
  <head>
    <title>Hello World Page</title>
  </head>
  <body>
    <h1>Hello, World! this is terraform </h1>
  </body>
</html>"  > /var/www/html/index.html
sudo systemctl restart apache2




# sudo apt update -y
# sudo apt install apache2 -y
# sudo systemctl enable apache2
# sudo apt-get install wget unzip php libapache2-mod-php php-mysql -y
# sudo wget https://wordpress.org/latest.zip
# sudo unzip latest.zip
# sudo cp -r wordpress/* /var/www/html/
# cd /var/www/html
# sudo rm -rf index.html
# sudo chown www-data:www-data -R /var/www/html/
# sudo chmod -R 755 /var/www/html/
# sudo systemctl restart apache2


