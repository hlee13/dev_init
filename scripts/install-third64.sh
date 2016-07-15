#!/bin/bash

# File    : install-third64.sh
# Author  : lihan
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2016-03-17 20:31:20

libs=(
    "geos"
    "gmock"
    "gtest"
    "shapelib"
    "boost" 
    "hiredis"
    "libevent" 
    "thrift" 
    "protobuf" 
    "log4cplus" 
    "libconfig" 
    "libconhash" 
    "json-cpp")

for ((i=0; i<${#libs[*]}; i++)) do
    echo ${libs[$i]}
    [ -e ${libs[$i]} ] && rm ${libs[$i]}
    ln -s /Users/didi/third-64/${libs[$i]} ${libs[$i]}
done

