#!/bin/bash

USERID=$(id -u)

# Check root user access
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

echo "You are running with root access"

# Validation function
VALIDATE() {
    if [ "$1" -ne 0 ]; then
        echo "$2.....FAILURE"
        exit 1
    else
        echo "$2.....SUCCESS"
    fi
}

# Install Nginx
dnf install nginx -y
VALIDATE $? "Installing Nginx"

# Install MySQL
dnf install mysql -y
VALIDATE $? "Installing MySQL"

# Install NodeJS
dnf install nodejs -y
VALIDATE $? "Installing NodeJS"
