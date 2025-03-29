#!/bin/bash

#By - Logan Bernthall 24/03/2025

####################################MD5 FILE CHECKER

#Iinitialise Variables

Prompt () {

	echo "------------------------------------"
	echo "----------- MD5 Checker------------"
	echo "------------------------------------"
	echo "------------------------------------"
	read -p "Enter MD5 you want to check against DB:"  MD5File
	echo "------------------------------------"

}
MD5CheckerHuman () {

	#Specifies path of where CSV File is located with MD5 Hashes
	MD5DBPath= #SPECIFY HERE THE PATH TO YOUR CSV FILE DB OF MD5 HASHES

	#Search For MD5
	if grep -w --color=always -i "$MD5File" "$MD5DBPath"
	then
		echo "Found!";
	else
		echo "MD5 not found - file integrity may be insufficient";
	fi


}

UserPrompt () {

while true; do 
	#Prompt user  to see if they want to continue
	read -p "Do you want to also check the systems MD5 for an  installed file? (y/n)" Choice  
	
	case "$Choice" in 
	[Yy]* )
		MD5TerminalCheck
		break
		;;
	[Nn]* )
		echo "Terminating Program"
		exit 0
		;;
	esac
done
}

MD5TerminalCheck () {

	echo "----------------------------------------"
        echo "----------- MD5 File Checker------------"
	echo "----------------------------------------"
	read -p "Please enter file name " FileToCheck
#	md5sum $FileToCheck
	echo "Searching for file within system..."
	   find / -name "$FileToCheck" | md5sum  
	#md5sum $FileToCheck
	
}

#Call Functions
Prompt
MD5CheckerHuman
UserPrompt
 
