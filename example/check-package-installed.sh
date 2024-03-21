#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
    package=$1
    #dpkg -s $pakcage &> /dev/null
    if dpkg -l | grep -q $package; then
        return 1
    else
        return 0
    fi
}

is_package_installed nginx
is_install=$?
echo "result is $is_install"