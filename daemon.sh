#!/bin/sh

while true; do
    time ./fetch.sh
    echo "done"
    sleep 30000
done 2>&1 | prefix -format='{{now | date "02/01/2006 15:04:05"}} {{DEFAULT}}'
