#!/bin/bash

#function is a block of code you can use again and again.
#it is used for repetative task
#code reusability


# syntex
# functioname(){
#     //code
# }

greetings(){
    echo "Hello Good Morning"
}

greetings  #to call the function just type the name of that function

#parameterised functions
sum(){
    a=14
    b=17
    c=$(($a+$b))
    echo "The sum of $a and $b is " $c
}

sum

getstudentname(){
    echo "the student name is " $1 $2
}
getstudentname "Aqeel" "Ali"

