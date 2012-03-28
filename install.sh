#!/bin/bash
cd $(dirname $0)

for i in ../.*; do
    skip=false
    for ignore in ".git" "." ".."; do
        #echo $i
        #echo "../"$ignore
        #echo "---"
        if [ "$i" = "../"$ignore ]; then
            skip=true
            break;
        fi;
    done;
    if [ $skip = true ]; then
        continue;
    fi;
    if [ ! -e "../"$i ]; then
        echo $(basename $i);
        ln -s $(realpath $i) ~/$(basename $i)
    fi;
done;
