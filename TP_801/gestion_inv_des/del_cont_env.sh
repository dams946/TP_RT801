#!/bin/bash

echo "------------------------------"
echo "Suppresson  de LXC_Conteneur"
sudo apt --purge remove lxc -y

if [ $? -ne 0 ]
then
    echo "Suppression de lxc a echoue"
    exit 1
else 
    echo "LXC Supprimer"
fi
echo "------------------------------------------------------------------"
echo "Suppression de lxctl"
sudo apt-get --purge remove lxctl -y

if [ $? -ne 0 ]; then
echo "Suppression de lxctl a echoué"
exit 1
fi
echo "--------------------------------------------------------------------------------"
echo "-----------------Suppression de openvswitch-common----------------"

sudo apt-get --purge remove  openvswitch-common -y

if [ $? -ne 0 ]
then
    echo "la desinstallation de 'openvswitch-common' a echoue"
    exit 1
fi

echo "-----------------------------------------------------------------------"

echo "Suppression de openvswitch"
sudo apt-get install openvswitch-switch -y

if [ $? -ne 0 ]
then   
    echo "la desinstallation de 'openvswitch-switch' a echoue"
    exit 1
fi

echo "------------------------------------------------------------------------"
echo "----------------------------Fin de l'installation-------------------------"

