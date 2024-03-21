#!/bin/bash

source ../source/message.sh
echo ""
read -p "You are \"ok\" or \"not\" ?? :  " choice
echo ""
case $choice in
        [Oo]k)
            message "you are OK" green true
            ;;
        [Nn]ot)
            message "you are NOT OK" red true
            ;;
        *)
            message "you type \"$choice\" and it's not in the case" yellow
            ;;
esac

echo ""