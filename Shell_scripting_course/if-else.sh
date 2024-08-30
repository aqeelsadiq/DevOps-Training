#!/bin/bash
#it is a conditional statement it check the condition and execute a block of code
#if the condition is true. it can execute another block of code if the  condition is false.

a=10

if [ $a -eq 10 ]
then
echo "a is equal to 10"

else 

echo "a is not equal to 10"

fi

read -p "enter your age: " age
if [ $age -gt 18 ]
then 
echo "you are eligible to cast vote"
else
echo "you are not eligible to cast vote"
fi