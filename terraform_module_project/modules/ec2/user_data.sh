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

#!/bin/bash
sudo apt update -y
sudo apt install apache2 php php-mysqli php-curl php-gd php-xml php-mbstring php-zip -y
sudo systemctl enable apache2
sudo apt-get install wget unzip -y
sudo snap install aws-cli --classic
sudo apt install mysql-client-core-8.0
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip -d /var/www/html/
sudo chown www-data:www-data -R /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/
sudo rm -rf /var/www/html/index.html
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

DB_USER=$(aws ssm get-parameter --name "/wordpress/db_user" --with-decryption --query "Parameter.Value" --output text)
DB_PASSWORD=$(aws ssm get-parameter --name "/wordpress/db_password" --with-decryption --query "Parameter.Value" --output text)
DB_NAME=$(aws ssm get-parameter --name "/wordpress/db_name" --with-decryption --query "Parameter.Value" --output text)
DB_HOST=$(aws ssm get-parameter --name "/wordpress/rds_endpoint" --query "Parameter.Value" --output text)

sudo sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '$DB_NAME');/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/^.*DB_USER.*$/define('DB_USER', '$DB_USER');/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '$DB_PASSWORD');/" /var/www/html/wordpress/wp-config.php
sudo sed -i "s/^.*DB_HOST.*$/define('DB_HOST', '$DB_HOST');/" /var/www/html/wordpress/wp-config.php
sudo systemctl restart apache2