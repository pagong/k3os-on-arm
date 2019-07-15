#!/bin/bash
#
# download armbian stretch image for odroid-n2

IMAGE=Armbian_5.89_Odroidn2_Debian_stretch_default_4.9.180

#https://dl.armbian.com/odroidn2/archive/Armbian_5.89_Odroidn2_Debian_stretch_default_4.9.180.7z

DIR=stretch
mkdir -p $DIR

curl -L https://dl.armbian.com/odroidn2/archive/$IMAGE.7z  -o $DIR/$IMAGE.7z

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

