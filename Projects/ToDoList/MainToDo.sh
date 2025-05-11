#!/bin/bash

#By - Logan Bernthall 09/05/2025


#######################################To Do List############################################

source "UtilToDo.sh"
source "ConfigToDo.sh"

echo "Running $APP_NAME with log level $LOG_LEVEL"

Prompt
ToDoPrinter
ToDoChecker