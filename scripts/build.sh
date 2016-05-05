#!/bin/bash

# File    : build.sh
# Author  : 
# Version : 1.0
# Company : 
# Contact : 
# Date    : 2015-07-23 12:13:55

mkdir build && cd build && cmake .. && make -j4 && make install

