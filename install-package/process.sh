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

run_htop() {
    mode=$1
    package=htop
    is_installed $package
    # Capture the return value of the function
    is_installed=$?

    if [[ $mode == 1 ]]; then
        if [[ is_installed == 0 ]]; then
            sudo apt install $package
            message "Installed : $package" green true
        else
            message "Package $package are already installed" yellow true
        fi
    fi

    if [[ $mode == 0 ]]; then
        if [[ is_nodejs_installed == 1 ]]; then
            sudo apt-get remove --auto-remove htop
            message "$package have been removed" yellow true
        else
            message "Package $package are not exists" yellow true
        fi
    fi

    # [[ $mode == 1 && ! is_installed ]] && sudo apt install htop
    # [[ $mode == 0 && && is_installed  ]] && sudo apt-get remove --auto-remove htop
}

run_node() {
    mode=$1
    is_installed nodejs
    is_nodejs_installed=$?

    is_installed npm
    is_npm_installed=$?

    if [[ $mode == 1 ]]; then
        if [[ is_nodejs_installed == 0 || is_npm_installed == 0 ]]; then
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
            sudo apt install nodejs npm
            sudo exit
            message "nodejs and npm have been installed" green true
        else
            message "Package nodejs and npm are already installed" yellow true
        fi
    fi

    if [[ $mode == 0 ]]; then
        if [[ is_nodejs_installed == 1 || is_npm_installed == 1 ]]; then
            sudo apt-get remove nodejs
            sudo apt-get remove npm
            message "nodejs and npm have been removed" yellow true
        else
            message "Package nodejs and npm are not exists" yellow true
        fi
    fi
}

run_pm2() {
    mode=$1
    package=pm2

    is_installed npm
    is_npm_installed=$?

    if [[ is_npm_installed = 0 ]]; then
        message "You have to install npm before install pm2." yellow 
        return 0
    fi

    if [[ $mode == 1 ]]; then
        if [[ is_npm_installed == 0 ]]; then
            npm install -g pm2
            message "Installed : $package" green true
        else
            message "Package $package are already installed" yellow true
        fi
    fi

    if [[ $mode == 0 ]]; then
        if [[ is_npm_installed == 1 ]]; then
           
            rm /usr/bin/pm2
            rm -r /usr/local/lib/node_modules
            rm -r /root/.pm2/

            message "$package have been removed" yellow true
        else
            message "Package $package are not exists" yellow true
        fi
    fi
}