#!/bin/bash

#Mise  en jour et Insall package

echo " -----------Upadate peckage----------------------"
sudo apt-get update -y
echo "------------------------------"
echo "Installation de LXC_Conteneur"
sudo apt install lxc -y

if [ $? -ne 0 ]
then
    echo "L'installation de lxc a echoue"
    exit 1
fi
echo "------------------------------------------------------------------"
echo "Installation de lxctl"
sudo apt-get install lxctl -y

if [ $? -ne 0 ]; then
echo "L'installation de lxctl a echoué"
exit 1
fi
echo "--------------------------------------------------------------------------------"
echo "-----------------Installation de openvswitch-common----------------"

echo "Installation de LXC_Conteneur"
sudo apt install lxc-templates -y

if [ $? -ne 0 ]
then
    echo "L'installation de lxc-temple a echoue"
    exit 1
fi

sudo apt-get install  openvswitch-common -y

if [ $? -ne 0 ]
then
    echo "L'installation de openvswitch-common a echoué"
    exit 1
fi

echo "-----------------------------------------------------------------------"

echo "Installation de openvswitch"
sudo apt-get install openvswitch-switch -y

if [ $? -ne 0 ]
then   
    echo "Installation de openvswitch a échoué"
    exit 1
fi

echo "------------------------------------------------------------------------"
echo "----------------------------Fin de l'installation-------------------------"

