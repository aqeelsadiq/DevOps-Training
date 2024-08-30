#!/bin/bash

#nested function means function inside the function

func1()
{
    echo "This is func1"
}

func2()
{
    echo "This is func2"
}

func1
func2

sum()
{
    echo "the sum of $1 and $2 is " $(($1+$2))

    sub()
    {
        echo "the diff of $1 and $2 is " $(($1-$2))
    }
    sub 4 2
}
sum 2 4