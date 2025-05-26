#!/bin/sh
# This is a comment!

a=10

until [ $a -lt 10 ]
do
   echo $a
   echo "Infinite loop sample"
   a=`expr $a + 1`
done