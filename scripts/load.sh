#!/bin/bash

my_cmd="PROJECT_XXX"
cd `dirname $0` || exit
mkdir -p status/$my_cmd
#ulimit -c unlimited

start() {
            bin/supervise.$my_cmd -u status/$my_cmd bin/$my_cmd conf/${my_cmd}.cfg 2>&1 &
}

stop() {
            killall -9 supervise.$my_cmd $my_cmd
}

case "$1" in
        start)
            stop
            start
            echo "Done!"
            ;;
        stop)
            stop
            echo "Done!"
            ;;
           *)
           echo "Usage: $0 {start|stop}"
           ;;
esac
