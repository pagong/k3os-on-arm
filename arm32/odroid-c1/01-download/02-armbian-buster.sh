#!/bin/bash
#
# download armbian buster image for odroid-c1

IMAGE=Armbian_5.90_Odroidc1_Debian_buster_next_5.1.15

#https://dl.armbian.com/odroidc1/archive/Armbian_5.90_Odroidc1_Debian_buster_next_5.1.15.7z

DIR=buster
mkdir -p $DIR

curl -L https://dl.armbian.com/odroidc1/archive/$IMAGE.7z  -o $DIR/$IMAGE.7z

cd $DIR
7z x $IMAGE.7z

ERR=$?

if [ "$ERR" = "0" ] ; then
    echo "Download OK!"
else
    echo "BAD Download !!!"
    exit 1
fi

cd ..
ln -s $DIR/$IMAGE.img Image-02

exit 0

