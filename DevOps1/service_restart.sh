#!/bin/bash

read -p "Input service name? : " service_name
service_name=$(echo "$service_name" | tr '[:upper:]' '[:lower:]')

if pgrep -x "$service_name" > /dev/null; then
    echo "Service $service_name is running"
    echo "Stopping service $service_name"
    
    sudo service "$service_name" restart
    echo "Service $service_name restarted successfully."
else
    echo "Service $service_name is not running"
fi