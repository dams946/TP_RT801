#!/bin/bash



esp=$( echo $1 |grep \*)

if [ $esp ]
then
    echo "--------------------------Destriction des conteneur LXC--------------------------"
    liste_conterner=$(sudo lxc-ls)
    sans_etoil=$(echo $1 | tr -d "*" )

    liste_final=( $( echo $liste_conterner | tr " " "\n" | grep $sans_etoil ))
    echo "list des conteneurs a Detruir  ======>  "${liste_final[@]}
    for i in ${liste_final[@]}
    do
        lxc-stop -n $i
        echo "destruction du $i"
        lxc-destroy -n $i

        if [ $? -ne 0 ]; then

        echo "la destrcution a echoué"
        exit 1
        else
        echo "la destruction a reussi"
        fi
    done
    
else
        echo "---------------------destruction du conteneur sans Joker -------------------------"
        lxc-stop -n $1
        lxc-destroy -n $1
        if [ $? -ne 0 ]
        then
                echo " destruction a echoue ! "
                exit 1
        fi
        echo " destruction du conteneur en arg: " $1 " : ok !"
fi
echo "---- -----------------Etat des container------------------ ----"
lxc-ls -f

echo "------------------------------------------------------------------"


