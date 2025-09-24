#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "%R ERROR $N :: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi



VALIDATE(){
if [ $1 -ne 0 ]; then
    echo  -e "ERROR:: Installing $2 is  $R failure $N"
    exit 1
else
    echo -e "Installing $2 is $G SUCCESS $N"
fi

}

if [ $? -ne 0 ];then 
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e " MySQL alerady exits...$Y SKIPPING $N"
fi

if [ $? -ne 0 ];then 
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e " NGINIX alerady exits...$Y SKIPPING $N"
fi

if [ $? -ne 0 ];then 

    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e " PYTHON3 alerady exits...$Y SKIPPING $N"
fi



