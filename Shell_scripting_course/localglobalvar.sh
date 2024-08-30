#!/bin/bash

#global variable - a variable that is define outside the function is called global variable
#local variable - a variable that is define inside the function is called local varible


#local variable
function1()
{
    a=10;
    echo $a
}
function1

#global variable
b=12;
function2()
{
    echo $b
}
function2






