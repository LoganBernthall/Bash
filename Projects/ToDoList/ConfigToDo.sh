#!/bin/bash

#By - Logan Bernthall 09/05/2025

#############################################Config File for To Do List################################

APP_NAME="To Do List"
LOG_LEVEL="INFO"
TO_DO_CSV_PATH="~/home/loganbernthall/Documents/Learning/Linux/'Bash Scripts'/ToDoList/ToDoCSV.csv"
Specific_File="ToDoCSV.csv"
Column_Check=4
Last_ID=$(tail -n +2 "$Specific_File" | awk -F, '{print $!}'| sort -n | tail -1)
Current_Date=$(date +"%Y-%m-%d")


#######################################################################################################
