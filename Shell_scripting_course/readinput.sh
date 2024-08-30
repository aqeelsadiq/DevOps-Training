#!/bin/bash
#if you want to get input from user you need to use the read keyword.
echo "enter your name"

read name

echo "your name is  $name"

read -p "enter your age" age       #p mean prompt
echo "your age is $age"

read -p "username : " username
read -sp "password: " password

echo " "

echo "username" $username "password" $password