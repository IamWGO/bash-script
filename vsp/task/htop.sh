
source ../source/message.sh
source ./check-installed.sh

installed=$(is_installed htop)

if [[ $installed==0 ]]; then
    message "do process" blue true
else    
    message "package is already installed" yellow
fi