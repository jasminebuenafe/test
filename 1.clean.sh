#!/bin/bash

echo enter data file
#foo=$1
read foo


cp $foo $foo.$$.tmp

sed -i '/^[[:space:]]*$/d;s/[[:space:]]*$//' $foo

paste - - <  $foo > $foo.1

# convert tab to pipe

sed 's/\t/\|/g' <  $foo.1 > $foo.pipe 



