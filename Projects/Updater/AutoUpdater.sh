#!/bin/bash

#By - Logan Bernthall 21/03/2025

#################################AutoUpdater###########################

Prompt () {

	echo "-------------------------------------"
	echo "----------Logan's Updater------------"
	echo "-------------------------------------"
}	

Checker (){
	#Checks for availble packages
	echo "--------------------------------"
	sudo apt update && apt list -updradable;
	echo "-------------------------------"
}

Clean (){

	#Cleans old packages
	echo "-----------------------------------"
	echo "Removing old packages after upgrade"
	sudo apt autoremove;
	echo "------------------------------------"
	notify-send "Updater Completed Job"
}

#Call Functions
Prompt
Checker
Clean
