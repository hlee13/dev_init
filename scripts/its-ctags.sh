#!/bin/bash

# File    : ctags.sh
# Author  : lihan
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2016-03-17 21:05:33

libs=(
    "WorkSpace/gitlab/its/its-lib/src"
    "WorkSpace/gitlab/its/its-proto/output"
    "WorkSpace/gitlab/its/its-thrift/output"
    "third-64/gtest"
    "third-64/gmock"
    "third-64/geos"
    "third-64/shapelib"
    "third-64/libevent" 
    "third-64/thrift" 
    "third-64/protobuf" 
    "third-64/log4cplus" 
    "third-64/libconfig" 
    "third-64/libconhash" 
    "third-64/json-cpp")

cd /Users/didi/WorkSpace/gitlab/

for ((i=0; i<${#libs[*]}; i++)) do
    find /Users/didi/${libs[$i]} -name *.h -o -name *.cpp -o -name *.c -o -name *.hpp -o -name *.cc -o -name *.hh
done > ctags.file

/Users/didi/ctags-5.8/bin/ctags -L ctags.file

cd -
