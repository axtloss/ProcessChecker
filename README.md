# ProcessChecker
Checks for processes in the System and reports by sending a message over xmpp to you if the CPU usage of a process exceeds a value you set

# Usage
To use this script, you just execute the .py, the py will basically just rerun the script ever 30 seconds, this value can be changed

Make sure that in the .sh script, you have set all the variables at the top:
"reciever" this is the name of the account which you set up for recieving the messages
"xmppAddress" this is the url of the Addres, for example: "myXmpp.com"
"checker" this is the name of the account which you set up for sending the messages
"checkerpass" this is the password of the account which you set up for sending messages
"cpuWarn" this is the value a process has to pass for the script to alert you (standart value is 100)

# Dependencies
-- python3
-- sendxmpp
-- a working xmpp server with atleast 2 accounts(one for the reciever of the messages, one for the script)


