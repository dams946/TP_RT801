#!/bin/bash
_user="$(id -u -n)"
_uid="$(id -u)"
echo "User name : $_user"
echo "User name ID (UID) : $_uid"
echo "ls: $(ls /home) "

echo "$IFS"
echo "$_user $_uid" > /home/user/TP_802/ty.txt