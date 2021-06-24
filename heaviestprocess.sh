#!/bin/bash
#This whole script is probably way too complicated than it needs to be
reciever="your XMPP name"
xmppAddress="your XMPP address"
checker="name this script should use to send you the notification"
Checkerpass="password of the checker account"
cpuWarn="100" #the value a process has to pass for the script to alert you

highestProcesses=$(ps -eo %cpu --sort=-%cpu | head | sed 's/%CPU//g')

#sorts the output of above command into an array looking string (value1 value2 value3)
highestProcessesArray=(${highestProcesses//$'\n'/ })

#works in a term, but not in a script
#highestProces=(${$(echo $highestProcessesArray | awk 'BEGIN { FS = " " }; { print $1 }' | awk 'BEGIN { FS = "." }; { print $1 }; { print $2 }')//$'\n'/ })

#Same thing as above, but more deobfuscated
temp=$(echo $highestProcessesArray | awk 'BEGIN { FS = " " }; { print $1 }' | awk 'BEGIN { FS = "." }; { print $1 }; { print $2 }') #takes the string we converted from a table above and pulls out the first value and removes the "." of it, as bash for some reason doesnt like these numbers
highestProces=(${temp//$'\n'/ }) #for some reason awk prints it out with a newline between the two numbers, so we make it to an array looking string
highestProces1=$(echo $highestProces | sed 's/ //g') # take out the space between the two numbers
#-----------------------------------

#echo $highestProces1
if [[ $highestProces1 -gt $cpuWarn ]];
then
	#regenerates the ps output for sending
	warn=$(ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 2 | sed 's/PID//g' | sed 's/CMD//g' | sed 's/%CPU//g' | sed 's/                             //')
	#sends the output of the command above via sendxmpp
	echo "WARN: HEAVY PROCESS "$warn"%" | sendxmpp -s High_Process $reciever@$xmppAddress  -u $checker@$xmppAddress -p $Checkerpass #--tls-ca-path="/etc/ssl/certs" --tls uncomment, if your xmpp server requires tls
fi
