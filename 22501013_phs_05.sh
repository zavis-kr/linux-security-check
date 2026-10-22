#!/bin/bash
CREATE_FILE="22501013_phs_05.txt" 
echo > $CREATE_FILE 2>&1
echo "=======05.Passwd rule check START =======" >> $CREATE_FILE 2>&1
echo " " >> $CREATE_FILE 2>&1
if [ -f /etc/login.defs ]
   then
      echo "======= [ Status ] =======" >> $CREATE_FILE 2>&1
      grep -v '#' /etc/login.defs | grep -i "PASS_MIN_LEN"  >> $CREATE_FILE 2>&1
      grep -v '#' /etc/login.defs | grep -i "PASS_MAX_DAYS" >> $CREATE_FILE 2>&1
      grep -v '#' /etc/login.defs | grep -i "PASS_MIN_DAYS" >> $CREATE_FILE 2>&1

#==============[START]===============
      if [ `cat /etc/login.defs | grep -i "PASS_MIN_LEN" | grep -v "#" | awk '{print $2}'` -gt 7 ]
         then
            echo "passwd rule check result : GOOD" >> password.txt
         else
            echo "passwd rule check result : BAD" >> password.txt
      fi

      if [ `cat /etc/login.defs | grep -i "PASS_MAX_DAYS" | grep -v "#" | awk '{print $2}'` -gt 70 ]
         then
            echo "passwd rule check result : BAD " >> password.txt
         else
            echo "passwd rule check result : GOOD" >> password.txt
      fi

      if [ `cat /etc/login.defs | grep -i "PASS_MIN_DAYS" | grep -v "#" | awk '{print $2}'` -gt 0 ]
         then
            echo "passwd rule check result : GOOD" >> password.txt
         else
            echo "passwd rule check result : BAD" >> password.txt
      fi
      echo "---------------[Result]---------------" >> $CREATE_FILE 2>&1
      if [ `cat password.txt | grep -i "BAD" | wc -l` -eq 0 ]
         then
            echo "passwd rule check result : GOOD" >> $CREATE_FILE 2>&1
         else
            echo "passwd rule check result : BAD" >> $CREATE_FILE 2>&1
      fi
      rm -rf password.txt
      echo "--------------[END]--------------" >> $CREATE_FILE 2>&1
else
   echo "/etc/login.defs file not founds" >> $CREATE_FILE 2>&1
fi

cat ./$CREATE_FILE
