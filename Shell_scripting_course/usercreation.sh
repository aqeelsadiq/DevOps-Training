#!/bin/bash

#How to create user using shell scripting
#usecase - for loop- username input - password - choice

for((i=0;i<=2;i++))
{
    echo "enter your choice:"
    read choice
    if [ $choice -eq 1 ]
    then

    echo "enter username:"
    read username

    echo "enter password"
    read password

    sudo useradd -m -s /bin/bash $username
    echo "$username:$password" | sudo chpasswd

    else
    break
    fi
}