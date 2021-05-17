#!/bin/bash

echo "-----------Installation de bridge------------------"

sudo ovs-vsctl add-br br0

if [ $? -ne 0 ]
then
    echo "La creation du bridge a échoue"
    exit 1
else
    echo " Bridge Créer"
fi

echo "-----------------------------------"
echo "---------------Start Br0-------------------"
sudo ip link set dev br0 up

if [ $? -ne 0 ]; then

echo "**Le Bridge n'est pas UP**"
exit 1

else
    echo "*le Bridge est UP*"
fi

echo "-----------------------------------------------------------"

sudo ip link set dev ovs-system up

if [ $? -ne 0 ]
then
    echo "---> Le Bridge No Active"
    exit 1
else
    echo "--> Le Bridge est Activé---"
fi

echo "----------------------------------------------"
echo "---l'etat du Bridge---"
sudo ovs-vsctl show
echo "--------------------------------------------------"