#!/bin/sh

rm cscope.*
find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.hpp" > cscope.files 
cscope -Rbkq -i cscope.files
