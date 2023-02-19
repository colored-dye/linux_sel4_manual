#!/usr/bin/bash
TOPDIR=$PWD
while IFS=" " read -r path url branch; do
    if [ $path == "---" ]; then
        # Stop cloning repos
        break
    else
        cd $TOPDIR/$path
        git diff > $TOPDIR/diffs/$(basename ${path})
    fi
done < $1
