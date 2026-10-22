#!/bin/bash
CREATE_FILE=`hostname`"22501013_phs_06".txt
echo > $CREATE_FILE 2>&1
echo "======= 06. shell check START ==========" >> $CREATE_FILE 2>&1
if [ -f /etc/passwd ] 
	then
		cat /etc/passwd | egrep "^daemon|^bin|^sys|^adm|^listen|^nobody|^nobody4|^noaccess|^diag|^operator|^games|^gopher" | grep -v "admin" >> $CREATE_FILE 2>&1
	echo "------------------[Result]------------------" >> $CREATE_FILE 2>&1
		if [ `cat /etc/passwd | egrep "^daemon|^bin|^sys|^adm|^listen|^nobody|^nobody4|^noaccess|^diag|^operator|^games|^gopher" | grep -v "admin" | egrep -v "false|nologin" | wc -l` -eq 0 ]
			then 
			    echo "shell check Result : Good" >> $CREATE_FILE 2>&1
			else
			    echo "shell check Result : BAD" >> $CREATE_FILE 2>&1
		fi
	echo "-------------------[END]-------------------" >> $CREATE_FILE 2>&1
cat ./$CREATE_FILE
	else
		echo "/etc/passwd File not found" >> $CREATE_FILE 2>&1
fi
