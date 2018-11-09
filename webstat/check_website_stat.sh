#/bin/bash

# script to check website URL is status (UP or DOWN)
#Create  a blank html file
echo > web_url.html
#Create Table
cat > web_url.html <<EOF
<table border="1">
<tr>
    <th>Environment URL</th>
    <th>Environment Status</th>
  </tr>
<br>
EOF

#Read lines from inputfile and print table rows
for line in `sed '/^$/d' $1`; 
do
echo "Hi : $line"
 curl -m 30 -LIs $line | grep "200 OK" > /dev/nul
status=`echo $?`
 if [ $status -ne 0 ];
 then
      web_stat=Down
      echo $web_stat
cat >> web_url.html <<EOT
 <tr>
 <td><a href>$line</a></td>
 <td><font color="red">$web_stat</font></td>
 </tr>
<br>
EOT

 else
      web_stat=UP
      echo $web_stat

# Insert rows into html file
cat >> web_url.html <<EOT
 <tr>
 <td><a href>$line</a></td>
 <td><font color="green">$web_stat</font></td>
 </tr>
<br>
EOT
fi
done  
