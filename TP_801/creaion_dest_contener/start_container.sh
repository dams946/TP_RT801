#!/bin/bash

#Demarrage
esp=$( echo $1|grep \* )
echo "salu" $esp
if [ $esp ]
then
    echo "-----------------Demarrage des conteneur avec un joker-----------------------"
    liste_conterner=$(sudo lxc-ls)
    mot_sans_etoil=$(echo $1 | tr -d "*")

    list_final=( $( echo $liste_conterner | tr " " "\n" | grep $mot_sans_etoil ) )
    for i in ${list_final[@]}
    do
        echo "----> Demarrage de :"$i
        lxc-start -n $i
        if [ $? -ne 0 ]
        then
        echo " le demarrage a echoue ! "
        exit 1
        fi
        echo "demarrage  de :" $i " : ok"
    done
else
        echo "---------------------demarrage du conteneur sans Joker -------------------------"
        lxc-start -n $1
        if [ $? -ne 0 ]
        then
                echo " le demarrage a echoue ! "
                exit 1
        fi
        echo " demarrage du container en arg: " $1 " : ok !"
fi
echo "---- -----------------Etat des container------------------ ----"
lxc-ls -f

echo "------------------------------------------------------------------"