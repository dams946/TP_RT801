if [ $# -ne 6 ]
then
    echo "le nombre d'argument manquante"
    exit 1

fi
echo "---creation du conteneur---"
lxc-create -n $2 -t $1



if [ $? -ne 0 ]; then

echo "la creation du conteneur a échoué "
exit 1

fi
echo "Creation du Conteneur  OK"

echo "-------------------------------------------------"

echo " Parametre du système"

echo "--- CPU / RAM"
echo "lxc.cgroup.cpuset.cpus= "$5 >> /var/lib/lxc/$2/config

if [ $? -ne 0 ]

then
    echo "Attribution du CPU à échoue"
    exit 1
fi

echo "--Attribution de CPU OK-- "
echo "------------------------------------------------------------"

echo "--------------------------changer le mot---------------------"
pass=$(openssl passwd -1 -salt ubuntu $6)
sed -i -e "s,^root:[^:]\+:,root:$pass:," /var/lib/lxc/$2/rootfs/etc/shadow

echo "lxc-cgroup.limit_in_bytes="$4 >> /var/lib/lxc/$2/config
if [ $? -ne 0 ]
then
    echo "Attribution du RAM à échoue"
    exit 1
fi
echo "--Attribution de RAM OK-- "

echo "-----------------------------------------"

echo "---> NETWORK---"
ed -i "s/lxc.net.0.type = veth/lxc.net.0.type = veth/g" /var/lib/lxc/$2/config
sed -i "s/lxc.net.0.link = lxcbr0/lxc.net.0.link = br1/g" /var/lib/lxc/$2/config


echo "lxc.net.0.veth.pair = br1-$2" >> /var/lib/lxc/$2/config
truncate -s 0 /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml
cat int.txt >> /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml

var2=$(echo $3)
sed -i 's,eth0: {dhcp4: true},eth0:\n      addresses:\n      - '$var2'\n      gateway4: 192.168.10.1,g' /var/lib/lxc/"$2"/rootfs/etc/netplan/10-lxc.yaml

echo "--------------------------------------------"

lxc-start -n $2
echo "nameserver 8.8.8.8" | lxc-attach $2 tee /etc/resolv.conf > /dev/null
if [ $? -ne 0 ]
then
    echo "------------DNS OK-----"
    exit 1
fi
lxc-ls -f
