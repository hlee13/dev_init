#!/bin/bash

# File    : build.sh
# Author  : lihan
# Version : 1.0
# Company : xiaojukeji
# Contact : lihan@diditaxi.com.cn
# Date    : 2015-07-23 12:13:55

mkdir build && cd build && cmake .. && make && make install

