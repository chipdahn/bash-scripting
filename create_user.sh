#!/bin/bash
addUser()
{
	USERNAME="$1"
	PASSWORD="$2"

	sudo useradd $USERNAME
	if [ -z $PASSWORD ];
	then 
		PASSWORD=$(openssl rand -base64 32)
	fi	
	#echo $PASSWORD
	echo "$USERNAME:$PASSWORD" | sudo chpasswd && echo "Acount for $1 has been created"

	touch credentials.txt
	echo "Welcome to our company, here are your login credentials" >> credentials.txt
	echo "Username: $USERNAME" >> credentials.txt
	echo "Password: $PASSWORD" >> credentials.txt

	#send mail with attachment
	#mail -A credentiais.txt -s "Here are your login details" "$USERNAME@gmail.com" < /dev/null && \
	echo "Mail has been successfully sent" && \
	echo "Deleting credential files" && \
	rm -rf credentials.txt 
}