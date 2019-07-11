#!/bin/bash
#
# download armbian bionic image for odroid-c2

IMAGE=Armbian_5.86_Odroidc2_Ubuntu_bionic_next_4.19.42

DIR=bionic
mkdir -p $DIR

curl -L https://dl.armbian.com/odroidc2/archive/$IMAGE.7z  -o $DIR/$IMAGE.7z

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

