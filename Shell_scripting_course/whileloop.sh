#!/bin/bash


#while loop works until the condition is true

# syntex
# while [ condition ]
# do
# //code whatever the code  you want to write here
# done
array=(1 2 3 4 5)
i=0
while [ $i -le 4 ];
do
echo ${array[i]}
let i++
done
