#!/bin/bash
#
# download armbian buster image for tinkerboard

IMAGE=Armbian_5.90_Tinkerboard_Debian_buster_next_4.19.57

#https://dl.armbian.com/tinkerboard/archive/Armbian_5.90_Tinkerboard_Debian_buster_next_4.19.57.7z

DIR=buster
mkdir -p $DIR

curl -L https://dl.armbian.com/tinkerboard/archive/$IMAGE.7z  -o $DIR/$IMAGE.7z

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

