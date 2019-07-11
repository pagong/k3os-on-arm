#!/bin/bash
#
# download ununtu bionic armhf image for raspberry-pi3

IMAGE=ubuntu-18.04.2-preinstalled-server-armhf+raspi3.img

#http://cdimage.ubuntu.com/releases/bionic/release/ubuntu-18.04.2-preinstalled-server-armhf+raspi3.img.xz

DIR=bionic
mkdir -p $DIR

curl -L http://cdimage.ubuntu.com/releases/bionic/release/SHA256SUMS -o $DIR/SHA256SUMS
curl -L http://cdimage.ubuntu.com/releases/bionic/release/$IMAGE.xz  -o $DIR/$IMAGE.xz

cd $DIR

SUM=$( sha256sum $IMAGE.xz )
sum1=$( echo $SUM | cut -d' ' -f 1)

sum2=$( grep -h $IMAGE SHA256SUMS | cut -d' ' -f1 )

if [ "$sum1" = "$sum2" ] ; then
    echo "Download OK!"
else
    echo "BAD Download !!!"
    exit 1
fi

unxz < $IMAGE.xz > $IMAGE

cd ..
ln -s $DIR/$IMAGE Image-01

exit 0

