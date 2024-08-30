#!/bin/bash

#until loop works until the condition is false
#if the condition becomes true you will come out of the loop it is the opposoite of while loop.

# syntex
# until [ condition ]
# do
# //code
# inc/dec
# done

i=0
until [ $i -ge 3 ];
do
echo "Aqeel"
let i++
done
