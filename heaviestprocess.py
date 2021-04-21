#!/usr/bin/python3

from os import system
from time import sleep

while True:
    system("bash $HOME/processWarn/heaviestprocess.sh")
    sleep(30)

