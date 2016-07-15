#!/bin/bash

# File    : ctags.sh
# Author  : lihan
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2016-04-07 11:14:36

find src/ -name *.h -o -name *.cpp -o -name *.c -o -name *.hpp -o -name *.cc -o -name *.hh > ctags.file
/Users/didi/ctags-5.8/bin/ctags -L ctags.file

cproject_init.sh
