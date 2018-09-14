#!/bin/bash

#Redirect to the working  directory
#cd /lmshome/Test/

if [ $# -eq 0 ]; then
	echo -e "\nUSAGE : sh DeleteLogs.sh clientname [ For Eg. : sh DeleteLogs.sh AC ].\n"
	exit 1
fi

#To print the command line argument
echo $1

#Redirect to the working  directory
#Log file to maintain the history of log files have been deleted

#cd ../../../../lmshome/Test/Log/
LOG_FILE="../../../../lmshome/Test/Log/logs.log"
#LOG_FILE="../../../../lmshome/Test/Log/deleted_files_log.log"
header="\n------------------------------*********This file shows the log of files have been deleted*********---------------------------------\n"
#echo -e $header >> ${LOG_FILE}

#function which prints the date/time and user information for every session
printInfo() 
{
	#echo "This file shows the log of files have been deleted."	
    	echo -e "\n[${USER}][`date`]" >> ${LOG_FILE}
}


printInfo

cd /lmshome/Test/$1/Logs/

find *.log -type f -mmin +1 -delete -print >> ${LOG_FILE} 
#find ./*.log -type f -mmin +1 -delete -print >> ${LOG_FILE} 
#find ./$1*.log -type f -mmin +2 -delete -print >> ${LOG_FILE} 
 
#find ./*.java -type f -mtime +2 -print0 | xargs -0 rm -f
cd $HOME

echo "Done";
