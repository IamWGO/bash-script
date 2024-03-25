#!/bin/bash

PACKAGE=${PACKAGE:-}

source ../source/message.sh


is_case=0
case $PACKAGE in 
    htop | nodejs | pm2) is_case=1 ;; 
    *) ;;
esac


if [[ $is_case=1 ]]; then
     read -p "Do you want to continue? (y/n): " CHOICE

    if [[ $CHOICE =~ ^[Yy]$ ]]; then

        case $PACKAGE in 
            htop) 
                ./task/htop.sh
            ;; 
            # not in case
            *) 
                #code here
            ;;
        esac




        message "install package \e[31m ${PACKAGE} \e[0m" green true
    else 
        message "You have canceled" yellow true
    fi
else 
    message "Bad command \e[31m ${PACKAGE} \e[0m" yellow true 
fi