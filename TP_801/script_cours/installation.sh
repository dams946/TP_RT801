#!/bin/bash

if [ -e $1 ] 
then
    echo "Dossier existe"
else
    echo "Dossier n'existe pas"
    exit
fi

if [ -r $1 ]
then
    echo "Premission to read "
fi
if [ -w $1 ]
then
    echo "Permission to write"
fi

if [ -x $1 ]
then echo " permision execute"
fi

#extraction
extention=$(echo $1|cut -d. -f2)

echo "$extention"

if [ $extention = tar ]
then
    echo "extention est tar"
    tar xvf $1 -C $2

elif [ $extention = zip ]; then
    echo "extention est zip"
    unzip $1 -d $2

elif [ $extention = tgz ]
then
    echo "extention est tgz"
    tar zxvf $1 -C $2

fi