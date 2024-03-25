#!/bin/bash
source ../source/message.sh

is_installed() {
    package=$1
    #dpkg -s $pakcage &> /dev/null
    if dpkg -l | grep -q $package; then
        return 1
    else
        return 0
    fi
}