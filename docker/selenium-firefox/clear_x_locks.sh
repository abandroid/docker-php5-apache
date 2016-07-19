#!/bin/bash

file="/tmp/.X??-lock"

echo "Looking for lock file: $file"
if [ -f $file ] ; then
    echo "Lock file: $file FOUND"
    rm $file
    echo "Lock file: $file REMOVED"
fi

my_dir="$(dirname "$0")"

"$my_dir/entry_point.sh"
