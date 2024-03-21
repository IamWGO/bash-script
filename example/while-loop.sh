#!/bin/bash

while true; do
    echo ""

    options=("yes - if you are agree"
            "no - if you are not agree"
            "quit - if you don't want to answer")

    # Display a numbered menu
    echo "Do you think this is a good structure :"
    for i in "${!options[@]}"; do
        echo "${options[i]}"
    done

      read -p "Your choice : " CHOICE
      

        case $CHOICE in
        [Yy]es )
            echo "Good to hear that you are happy"
            #break
        ;;
        [Nn]o )
            echo "Sorry to hear that you are unhappy"
            #break
        ;;
        [Qq]uit )
            echo ""
            echo "Exit bash..."
            exit 
        ;;
        * )
            echo "Please answer yes , no or quit." ;;
    esac
done
