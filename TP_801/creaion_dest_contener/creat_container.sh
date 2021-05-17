#!/bin/bash

#echo "Donnez un template,un nom du Conteneur, un address ip, un ram, un cpu, un mot de passe"

if [ $# -ne 6 ]
then
	echo " les arguments ne sont pas au complet ! "
	echo "./creat_contaner.sh"
        echo "Donnez un template,un nom du Conteneur, un address ip, un ram, un cpu, un mot de passe"
	exit 1
fi

# creation du conteneur

echo "creation du container"
sudo lxc-create -n $2 -t $1
if [ $? -ne 0 ]
then
	echo " la creation de container a echoue ! "
	exit 1
fi
echo "creation du container a reussie"
# Demarrage de la machine

echo "configuration du systeme"

echo "demarrage du Conteneur"
sudo lxc-start -n $2
if [ $? -ne 0 ]
then
  echo " erreur lors du demarrage de la machine ! "
  exit 1
fi

sleep 5

# ----------- CPU ------------------
sudo lxc-cgroup -n $2 cpuset.cpus $5
if [ $? -ne 0 ]
then
	echo " Attribution du cpu a echoue ! "
	exit 1
fi
echo " le cpu est :"
#lxc-cgroup -n $2 cpuset.cpus

#------------------- RAM------------------------

sudo lxc-cgroup -n $2 memory.limit_in_bytes $4
if [ $? -ne 0 ]
then
	echo " erreur lors de la modification de la memoire allouee ! "
	exit 1
fi


echo "Attribution memoire reussie "

echo "------- Mot de passe ------- "
echo -e $6"\n"$6 | sudo lxc-attach -n $2 passwd root

if [ $? -ne 0 ]
then
	echo "changement mot de passe a echoue! "
	exit 1
fi

#-------------------Address ip------------------------
echo "---- Adresse ip ---- "
sed -i 's/lxc.net.0.link = lxcbr0/lxc.net.0.link = brODO/g' /var/lib/lxc/$2/config

truncate -s 0 /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml
cat int.txt >> /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml
var2=$(echo $3)
sed -i 's,eth0: {dhcp4: true},eth0:\n      addresses:\n      - '$var2'\n      gateway4: 192.168.10.1,g' /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml

if [ $? -ne 0 ]
then
	echo "attribution d addrese a echoue!"
	exit 1
fi

sudo lxc-stop -n $2
sudo lxc-ls --fancy

#sleep 3

#sudo lxc-start -n $2

