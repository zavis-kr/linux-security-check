#!/bin/bash
CREATE_FILE="22501013_phs_03".txt
echo > $CREATE_FILE 2>&1
echo "====03.Passwd File Permission Check start====" >> $CREATE_FILE 2>&1
if [ -f /etc/passwd ]
   then
      ls -alL /etc/passwd >> $CREATE_FILE 2>&1
   if [ `ls -alL /etc/passwd | awk '{print $1}' | grep ".rw-r--r--" | wc -l` -eq 1 ]
       then
          echo "Passwd file permission check Result : GOOD" >> $CREATE_FILE 2>&1
       else
          echo "Passwd file permission check Result : BAD" >> $CREATE_FILE 2>&1
       fi       
else
       echo "/etc/passwd file not found" >> $CREATE_FILE 2>&1
fi

echo "----------[END]----------" >> $CREATE_FILE 2>&1

cat ./$CREATE_FILE
