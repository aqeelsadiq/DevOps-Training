#!/bin/bash

#Break -  it is used to break the execution of loop
#continuous - it skip the execution on some certain condition

for((i=0;i<=10;i++))
{
    if [ $i -eq 6 ]
    then
    break
    else
    echo $i
    fi

}

#continuos - cont statement skip that particular part that you mention in your condition.
for((i=0;i<=10;i++))
{
    if [ $i -eq 3 ]
    then
    continue
    else
    echo $i
    fi

}
