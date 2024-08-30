#!/bin/bash
read -p "enter grade: " grade
case $grade in
    A) 
     echo "your marks in between 90-100"
     ;;
    B)
     echo "your marks in between 80-90"
     ;;
    C)
     echo "your marks in between 70-80"
     ;;
esac