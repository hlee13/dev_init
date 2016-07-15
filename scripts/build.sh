#!/bin/bash

# File    : build.sh
# Author  : lihan
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2015-07-23 12:13:55

mkdir -p build && cd build && cmake .. && make -j4 && make install

