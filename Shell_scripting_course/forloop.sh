#!/bin/bash

#three types of loops for, while and until loop

myarray=(python c++ c java)
echo ${myarray[1]}

#syntex of for loop
# for((initialization; condition; inc/dec)){
    
# }
for ((i=0; i<5; i++)){
    echo "sorry";
}

#for loop is used that how many times you want to iterate a block of code.

for i in aqeel abdulllah aslam 
do
    if [ $i == aqeel ]
    then
    echo "aqeel is a good boy"
    fi
done
#you can define list of array and print using for loop
myarray=(java c c++  kotlin shellscripting go python ruby)
for((i=0; i<8; i++))
{
    echo "${myarray[i]}"
}