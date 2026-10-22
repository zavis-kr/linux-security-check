#!/bin/bash
CREATE_FILE="22501013.phs.08".txt
echo > $CREATE_FILE 2>&1
echo "========== 08.Shadow check START ==========" >> $CREATE_FILE 2>&1
if [ -f /etc/shadow ]
	then 
		ls -alL /etc/shadow >> $CREATE_FILE 2>&1
echo "---------------[Result]-------------" >> $CREATE_FILE 2>&1
if [ `ls -alL /etc/shadow | awk '{print $1}' | grep "..--------" | wc -l` -eq 1 ]
	then
	  echo "shadow Check Result : GOOD" >> $CREATE_FILE 2>&1
	else
	  echo "shadow Check Result : BAD" >> $CREATE_FILE 2>&1
fi
echo "---------------[END]---------------" >> $CREATE_FILE 2>&1
cat ./$CREATE_FILE
	else
		echo "/etc/shadow File not found" >> $CREATE_FILE 2>&1
fi
echo " " >> $CREATE_FILE 2>&1
