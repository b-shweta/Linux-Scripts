#/bin/bash

# script to check website URL is status (UP or DOWN)

while IFS='' read -r line || [[ -n "$line" ]]; 
 
do

echo "Hi : $line"
 
curl -m 30 -LIs $line | grep "200 OK" > /dev/nul
status=`echo $?`
 if [ $status -ne 0 ];
 then
      web_stat=Down
      echo $web_stat
 else
      web_stat=UP
      echo $web_stat
 fi

done < "$1"
