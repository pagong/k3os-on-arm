#!/bin/bash
#
# download armbian bionic image for odroid-n2

IMAGE=Armbian_5.89_Odroidn2_Ubuntu_bionic_default_4.9.180

#https://dl.armbian.com/odroidn2/archive/Armbian_5.89_Odroidn2_Ubuntu_bionic_default_4.9.180.7z

DIR=bionic
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
ln -s $DIR/$IMAGE.img Image-03

exit 0

