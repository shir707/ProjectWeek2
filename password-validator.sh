#!/bin/bash

PASSWORD=$1
LEN=`echo ${#PASSWORD}`
# Set the color variable- we color the output in green if the all the checking are passed and red if didn't
green='\033[0;32m'
red='\033[0;31m'
# Clear the color after that
clear='\033[0m'
##checking if the length is less then 10
if [[ $LEN -lt 10 ]]; then
echo -e "${red}Password must be of at least 10 characters!${clear}"
exit 1
fi
##this echo returns 0 if all the checkings are passed
CHECK=`echo $PASSWORD | grep "[a-z]" | grep "[A-Z]" | grep "[0-9]"` 
if [[ $? -ne 0 ]]; then
echo -e "${red}Password must contain atleast 1 uppercase, lowercase and digits${clear}"
exit 1
else
echo -e "${green}Strong Password${clear}"
fi
exit 0

