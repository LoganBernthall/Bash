#!/bin/bash

#MX Lookup Tool
#Created By - Logan Bernthall 31/03/2025

#Install
#sudo apt-get install whiptail


#############################################################################
UI () {


Domain=$(whiptail --inputbox "Enter Domain" 8 39 --title "MX Lookup Tool" 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus -ne 0 ]; then 

	exit 1

else

	if ["$Domain" = ""]; then

		whiptail --title "Error" --msgbox "Please enter a domain" 8 78
		UI #Recalling UI if no input detected

	else
		#Proceed to ping check once input is detected 
		if ping -c 1 -W 1 "$Domain" &> /dev/null; then
			NSLook
		else
			whiptail --title "Error" --msgbox "Domain entered does not exist" 8 78
			UI
		fi
	fi
fi
}

NSLook () {

ResultDig=$(dig +short -t mx  $Domain)
ResultDMARC=$(dig _dmarc.$Domain +short -t txt)
ResultIP=$(host -t a $Domain)
ResultDNS=$(host -t ns $Domain)
whiptail --ok-button Done --msgbox "MX Results:\n$ResultDig\nDMARC Results:\n$ResultDMARC\nIP:\n$ResultIP\nDNS:\n$ResultDNS" 25 40
UI

}

#Call Functions
UI
