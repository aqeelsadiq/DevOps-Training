#!/bin/bash
#how to delete user using shell script

echo "enter the username: "

read username

echo "enter the  password: "

read password

deluser(){
    echo $password | sudo -S deluser $username
}

deluser


