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

#Option Menu
ToDoMenu () {

#Menu for the list
echo "Select an option:"
echo "Type 1 - To add a task"
echo "Type 2 - To remove a task"
echo "Type 3 - To change the status of an existing task"
echo "Type 4 - Exit"

read Menu_Input

case "$Menu_Input" in
	"1")
	Option1
	;;
	"2")
	Option2
	;;
	"3")
	Option3
	;;
	"4")
	Option4
	;;
	*)
	echo "Invalid"
	;;
esac

}


Option1 (){
#Option 1 - Add a task

read -p "Enter your new task" Task
Today=$(date +"%y-%m-%d")
echo "\"$Task\",$Today,N," >> "$Specific_File"
}

Option2 () {
#Option 2 - Remove a task

echo "Remove a task from list:"

#Print into terminal
column -s, -t < $Specific_File

read -p "Please enter # you wish to delete" LineNumber

sed -i "${LineNumber}d" "$Specific_File"

echo "$LineNUmber has been removed"

}
Option3 () {
#Option 3 - Change status of an exisiting task
echo "Modify a task:"
column -s, -t < $Specific_File
#Print into terminal
read -p "Enter the line # you wish to modify" Line

#Ignore header
$ActualLine=$(($Line + 1))
echo $ActualLine

}
Option4 () {
echo "Exiting..."
exit 1
}
