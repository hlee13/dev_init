#!/bin/bash
#/*
#*  File    : git_commit_nightly.sh
#*  Author  : lihan
#*  Version : 1.0
#*  Company : 
#*  Contact : 
#*  Date    : 2016-03-15 00:16:14
#*/

git_path_lst=(
    "/Users/didi/WorkSpace/CWorkSpace"
    "/Users/didi/WorkSpace/JVMWorkSpace" 
    "/Users/didi/WorkSpace/PythonWorkSpace")

for ((i=0; i<${#git_path_lst[@]}; i++)) do
    cd ${git_path_lst[$i]} && git commit -am 'Nightly commit'
done
