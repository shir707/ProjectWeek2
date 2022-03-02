#!/bin/bash

option="${1}" 
case ${option} in 
   -f) FILE="${2}" 
       while read line; do
       # reading each line
       PASSWORD=$line
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
       echo $PASSWORD | grep "[a-z]" | grep "[A-Z]" | grep "[0-9]"
       if [[ $? -ne 0 ]]; then
       echo -e "${red}Password must contain atleast 1 uppercase, lowercase and digits${clear}"
       exit 1
       else
       echo -e "${green}Strong Password${clear}" 
       fi
       exit 0
       done < $FILE
      ;; 
   *)  
      echo "`basename ${0}`:usage: [-f file]" 
      exit 1 # Command to come out of the program with status 1
      ;; 
esac 



