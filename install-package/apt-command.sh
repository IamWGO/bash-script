#!/bin/bash

COMMAND=${COMMAND:-}

source ../source/message.sh

if [ -z "$PACKAGE" ]; then
    case $COMMAND in
        update)
            message "start: apt-update" green true
            sudo apt update 
            message "end : apt-update" green true
            ;;
        upgrade)
            message "start: run apt-upgrade" green true
            sudo apt upgrade
            message "end : run apt-upgrade" green true
            ;;
        *)
            message "command: $COMMAND" green
            ;;
    esac
else
    message "variable is undifined" yellow
fi