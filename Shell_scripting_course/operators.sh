#!/bin/bash

#we will discuss about arithematic relational etc
read -p "enter n1" n1
read -p "enter n2" n2

echo "addition $(($n1+$n2))"
echo "substraction $(($n1-$n2))"
echo "multiply $(($n1*$n2))"
echo "division $(($n1/$n2))"
echo "modulus $(($n1%$n2))"


echo "Relational operaators"
if [ $n1 -gt $n2 ]
then 
echo "n1 > n2"
fi
#-ge greater then or equal to
#-gt greater then
#-le less then or equal to
#-lt less then
#-ne not equal to
