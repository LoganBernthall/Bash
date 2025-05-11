#!/bin/bash

#By - Logan Bernthall 24/03/2025



############################################Utility File For To Do List###########################

source "ConfigToDo.sh"

Prompt() {

#Prints linux username with $USER
echo "Hi $USER, welcome to your to do list"

}

ToDoPrinter() {

#Print into terminal
column -s, -t < $Specific_File

}

ToDoChecker() {
echo " "
#Function to check if any tasks are not completed
NotComplete=$(awk -F',' -v col="$Column_Check" 'NR > 1 && tolower($col) ~ /n/ { print }' "$Specific_File")


# Check if matches were found
if [[ -n "$NotComplete" ]]; then
    echo "You have the following tasks needing to complete"
	echo "$NotComplete"
else
    echo "Well done! All tasks to completed!"
fi

}