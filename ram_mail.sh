#!/bin/bash
#YOU NEED TO HAVE MPSTAT INSTALLED ON THE SYSTEM TO USE THE CPU FUNCTIONALITY
#TO=""   <-remove # FOR EMAIL FUNCTIONALITY
#SET TH_L_RAM AND TH_L_CPU VALUES ACCORDINGLY
TH_L_RAM=100000
TH_L_CPU=97.00
free_RAM=$(free -mt | grep -E "Total: " | awk '{print $4}')
idle_CPU=$(mpstat | awk ' NR == 4 {print $NF}')

if [[ $free_RAM -le $TH_L_RAM ]]
then
  echo -e "Server is running with low ram size\n Available RAM is: $free_RAM"

#USE BELOW TO SEND MAIL WITH THE RAM INFO
# | mail -s "RAM INFO" $TO
fi

if (( $(echo "$idle_CPU < $TH_L_CPU" | bc -l) ))
then
  echo -e "Server is utilizing more than 94% CPU power: current idle CPU $idle_CPU"
#USE BELOW TO SEND MAIL WITH THE CPU INFO
# | mail -s "CPU INFO" $TO

python3 email_sender_scr.py $free_RAM $idle_CPU
fi

