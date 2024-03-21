#!/bin/bash

PACKAGE=${PACKAGE:-}
MODE=${MODE:-}

source ../source/message.sh
source ./process.sh

confirm_continue(){
    package=$1
    mode=$2

    if [[ $mode == 1 ]]; then
        message "INSTALL package \"$package\"" yellow true
    else
        message "UNSTALL package \"$package\"" yellow true
    fi

    read -p "Do you want to continue? (y/n): " CHOICE
    
    if [[ $CHOICE =~ ^[Yy]$ ]]; then
        case $package in 
            htop)  run_htop $mode ;; 
            nodejs) run_nodejs $mode ;;
            pm2) run_nodejs $mode ;;
            *)  
            is_case=false
            message "create function \"run_$package\" + install/remove package" yellow true ;;
        esac 
    else 
        message "You have canceled" yellow true
    fi
}

if [ -z "$MODE" ]; then
    message "Bad command" yellow true
    exit
fi

if [ ! -z "$PACKAGE" ]; then
    if [[ $MODE == 1 || $MODE == 0 ]]; then
        confirm_continue $PACKAGE $MODE
    else    
        message "Bad command" red true
    fi 
else
    message "PACKAGE is not define. #1" red true
fi


