#!/bin/bash

source ../source/message.sh

COLOR=${COLOR:-red}

message "This is a read text" $COLOR
message "this is a read background" $COLOR true