#!/bin/bash 

read -p "Enter the absolute path of file: " path
read -p "Enter the absolute path of file: " path
output=$(find $path -type f -mtime -24)
if [ -e $path ];
then 
	echo "File exists"
	if [ $output -z ];
	then
		echo "updates detected"
		rsync -a -progress $path $name
		echo ".."
		sleep 1
		echo "..."
		sleep 3
		echo "Backup Created";
	else
		echo "No new update available"
	fi
else
	echo "File doesn't exist";
fi

##To delete the files after four days

find $path $name -mtime +4 -exec rm {} \;