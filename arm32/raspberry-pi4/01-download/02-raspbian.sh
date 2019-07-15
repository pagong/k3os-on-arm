#!/bin/bash
#
# download raspbian lite buster image for raspberry-pi4

#IMAGE=2019-06-20-raspbian-buster-lite
IMAGE=2019-07-15-raspbian-buster-lite

#https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-06-24/2019-06-20-raspbian-buster-lite.zip

DIR=raspbian
mkdir -p $DIR

#curl -L https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-06-24/$IMAGE.zip.sha256   -o $DIR/$IMAGE.zip.sha256
#curl -L https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-06-24/$IMAGE.zip	    -o $DIR/$IMAGE.zip
curl -L https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-15/$IMAGE.zip.sha256   -o $DIR/$IMAGE.zip.sha256
curl -L https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-15/$IMAGE.zip	    -o $DIR/$IMAGE.zip

cd $DIR

SUM=$( sha256sum $IMAGE.zip )
sum1=$( echo $SUM | cut -d' ' -f 1)

sum2=$( grep -h $IMAGE $IMAGE.zip.sha256 | cut -d' ' -f1 )


if [ "$sum1" = "$sum2" ] ; then
    echo "Download OK!"
else
    echo "BAD Download !!!"
    exit 1
fi

unzip $IMAGE.zip

cd ..
ln -s $DIR/$IMAGE.img Image-02

exit 0

