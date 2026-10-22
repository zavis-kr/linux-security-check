#!/bin/bash
CREATE_FILE="22501013_phs_02".txt
echo > $CREATE_FILE 2>&1
echo "=========02.root_mgm start=========" >> $CREATE_FILE 2>&1
if [ `awk -F: '$3==0' /etc/passwd | wc -l` -eq 1 ]
	then 
		echo "========== GOOD ==========" >> $CREATE_FILE 2>&1
		awk -F: '$3==0 { print $1 " -> UID="$3 }' /etc/passwd >> $CREATE_FILE 2>&1
	else
		echo "========== BAD ==========" >> $CREATE_FILE 2>&1
fi
cat ./$CREATE_FILE
