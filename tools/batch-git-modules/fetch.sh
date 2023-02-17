#!/usr/bin/bash

# Fetch git repositories from a manifest file
# One line each.
# Format: <path> <url>

rm -f .fetch-log

CLONING=1

while IFS=" " read -r path url branch; do
    if test $CLONING -eq 1; then
        if [ $path == "---" ]; then
            if test $CLONING -eq 1; then
                CLONING=0
            fi
        else
            printf "%s %s -- " $url $path $branch
            if ! test -d $path || ! test -d $path/.git; then
                git clone $url $path -b $branch >>.fetch-log 2>&1
                date >> .fetch-log
                if test $? -ne 0; then
                    echo -e "\e[31mFailed\e[0m"
                else
                    echo -e "\e[32mFinished\e[0m"
                fi
            else
                echo -e "\e[33mSkipped\e[0m"
            fi
        fi
    else
        $path $url $branch
    fi
done < $1
