#!/bin/bash

CREATE_FILE="22501013_phs_01".txt
echo > $CREATE_FILE 2>&1
echo "=======01.Default ID=======" >> $CREATE_FILE 2>&1
echo " " >> $CREATE_FILE 2>&1
if [ `cat /etc/passwd | egrep "lp:|uucp:|nuucp:" | wc -l` -eq 0 ]
	then
		echo "lp, uucp, nuucp not found" >> $CREATE_FILE 2>&1
	else
		cat /etc/passwd | egrep "lp:|uucp:|nuucp:" >> $CREATE_FILE 2>&1
fi

cat ./$CREATE_FILE
