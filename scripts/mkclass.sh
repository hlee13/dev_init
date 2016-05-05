#!/bin/bash

# File    : mkclass.sh
# Author  : 
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2015-07-23 11:20:08

if [ $# -eq 0 ];then
    echo "Usage: `basename $0` {CLASSNAME}"
    exit 1
else
    CLASSNAME=$1
fi

FILENAME=`echo ${CLASSNAME} | sed 's/[A-Z]/_\L&/g'`
vim -c "10,18 d |r ~/.vim/templete/cpp/cpp.tpl |%s/XXX/${CLASSNAME}/g| 10 |
    vs ${FILENAME}.h|12 r ~/.vim/templete/H/H.tpl |%s/XXX/${CLASSNAME}/g" ${FILENAME}.cpp
