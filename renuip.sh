#!/bin/bash

PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
CURRENT_IP=`tail -1 /mnt/rd/ip.log 2>/dev/null` 

if [ $? -ne 0 ] || [ $PUBLIC_IP != $CURRENT_IP ]; then
   echo $PUBLIC_IP >> /mnt/rd/ip.log  
   # NOTIFY
   #curl -s -u o.[Q$EfOO8HxbBcCv9Tc9obxlpaBxu8gmiXU]:txnbxn https://api.pushbullet.com/v2/pushes -d type=note title="My IP" -d body=`echo $PUBLIC_IP` > /dev/null
   #echo "
   #   verbose
   #   open www3.telus.net
   #   user jmrclab passwd
   #   cd raspi3
   #   ascii
   #   put /mnt/rd/ip.log ip.log
   #   bye
   #" | ftp -n > /tmp/ftp_$$.log
   #curl -s -u o.[Q$EfOO8HxbBcCv9Tc9obxlpaBxu8gmiXU]:txnbxn https://api.pushbullet.com/v2/pushes -d type=note title="New IP" -d body=`echo "new.ip"` > /dev/null
   echo $PUBLIC_IP >> /mnt/rd/renuip_notify.txt
   /usr/sbin/ssmtp myemail@gmail.com < /mnt/rd/renuip_notify.txt
fi
