#!/bin/bash

# File    : make.sh
# Author  : 
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2015-07-23 13:28:53

# cd build && cmake .. && make && make install
cd build && make -j4 && make install && cd -

if [ $? -ne 0 ]; then
    cd - 
fi

