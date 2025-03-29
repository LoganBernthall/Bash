#!/bin/bash

ping -c 3 google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo 'Internet is working'
else
	echo 'Internet is not working'
fi
