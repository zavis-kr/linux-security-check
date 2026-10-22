#!/bin/bash
CREATE_FILE="22501013_phs_07".txt
echo > $CREATE_FILE 2>&1
echo "======= 07.su check START =======" >> $CREATE_FILE 2>&1
if [ -f /etc/pam.d/su ]
then
	echo "(1) /etc/pam.d/su File" >> $CREATE_FILE 2>&1
	cat /etc/pam.d/su >> $CREATE_FILE 2>&1
 
  	if [ -f /etc/group ]
      		then 
       		   echo "(2) /etc/group File" >> $CREATE_FILE 2>&1
            	   cat /etc/group >> $CREATE_FILE 2>&1

		   echo " " >> $CREATE_FILE 2>&1
		   echo "(3) wheel group members" >> $CREATE_FILE 2>&1
		   cat /etc/group | grep "^wheel" >> $CREATE_FILE 2>&1
      		else
       		   echo "/etc/group File not found" >> $CREATE_FILE 2>&1
	fi

  echo "------------------------[Result]------------------------" >> $CREATE_FILE 2>&1
           if [ `cat /etc/pam.d/su | grep -v 'trust' | grep 'pam_wheel.so' | grep 'use_uid' | grep -v '^#' | wc -l` -eq 0 ] || [ `cat /etc/group | grep "^wheel" | awk -F: '{print $4}' | tr ',' '\n' | grep -v "root" | grep -v "parkhyeseong" | wc -l` -ge 1 ]
		then
			echo "SU Check Result : BAD" >> $CREATE_FILE 2>&1
		else
			echo "SU Check Result : GOOD" >> $CREATE_FILE 2>&1
	    fi
echo "------------------------[END]------------------------" >> $CREATE_FILE 2>&1
cat ./$CREATE_FILE
else
	echo "/etc/pam.d/su File not found" >> $CREATE_FILE 2>&1
fi
