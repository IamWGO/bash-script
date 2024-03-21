#!/bin/bash

# Define a function named multiply
message() {
    #  $1 $2 $3
    message=$1
    color=$2
    backgroud=$3

    # one-liner if-else statements
    [ -z "$backgroud" ] || [ "$backgroud" == "false" ] && prefix="3" || prefix="4"
    case $color in 
        red)  code="${prefix}1" ;;
        green)  code="${prefix}2" ;;
        yellow)  code="${prefix}3" ;;
        blue)  code="${prefix}4" ;;
        magenta)  code="${prefix}5" ;;
        cyan)  code="${prefix}6" ;;
        white)  code="${prefix}7" ;;
        #*) echo $message ;;
    esac 

    if [ -z "$code" ]; then
         echo $message
    else
        echo -e "\e[${code}m ${message} \e[0m"
    fi
}
