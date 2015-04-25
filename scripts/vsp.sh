#!/bin/bash

checkInt(){ 
    expr $1 + 1 &>/dev/null
    [ $? -ne 0 ] && { echo "Args must be integer!";exit 1; } 
} 

if [ $# -eq 0 ];then
    echo "Usage: `basename $0` {file_parttern}"
    exit
fi

filename=(`find . -type f -iname "$@" | sort | egrep -v "\\.o|\\.a|\\.so|\\.class|\\.pyc"`)
fileCnt=${#filename[*]}

if [ ${fileCnt} -eq 0 ]; then
    echo "Not Found $@"
    exit
fi

if [ ${fileCnt} -eq 1 ]; then
    vi ${filename}
    exit
fi

for(( i=1; i <= ${fileCnt}; i++ )) do
    echo $i, ${filename[`expr $i - 1`]}
done

read -p "Enter a number: " fileNum
checkInt $fileNum
#[ ${#fileNum} -eq 0 ] && echo "Bye!" && exit
[ ${#fileNum} -eq 0 ] && { vi ${filename[0]} ; exit ; }
[ $fileNum -eq 0 -o $fileNum -gt ${fileCnt} ] && { echo "Args too larger !";exit 1; } 
vi ${filename[`expr ${fileNum} - 1`]}
