#!/bin/bash

echo "-----------Bridge DOWN-------------------"
sudo ip link set dev br0 down
sudo ip link set dev ovs-system down

if [ $? -ne 0 ]; then

echo "---> le Bridge n'est pas DOWN"
exit 1

else
    echo "----> Bridge DOWN---"
fi

echo "----------Supppression de Bridge--------"

sudo ovs-vsctl del-br br0

if [ $? -ne 0 ]
then
    echo "Suppression échoué"
    exit 1
else
    echo "------------> Bridge supprimer-------"
fi

echo "etat du bridge"
sudo ovs-vsctl show

echo "--------------------------"