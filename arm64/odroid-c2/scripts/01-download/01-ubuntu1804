#!/bin/bash
#
# download ubuntu-18.04 minimal image for odroid-c2

IMAGE=ubuntu-18.04-3.16-minimal-odroid-c2-20180626.img

DIR=hardkernel
mkdir -p $DIR

curl -L http://de.eu.odroid.in/ubuntu_18.04lts/C2/$IMAGE.xz.md5sum  -o $DIR/$IMAGE.xz.md5sum
curl -L http://de.eu.odroid.in/ubuntu_18.04lts/C2/$IMAGE.xz         -o $DIR/$IMAGE.xz

cd $DIR

SUM=$( md5sum $IMAGE.xz )
sum1=$( echo $SUM | cut -d' ' -f 1)

sum2=$( grep -h $IMAGE $IMAGE.xz.md5sum | cut -d' ' -f1 )


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

