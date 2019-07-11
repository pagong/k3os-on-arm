#!/bin/bash
#
# download hypriotos image for odroid-c2

REL=v0.4.1
IMAGE=hypriotos-odroid-c2-v0.4.1.img

#https://github.com/hypriot/image-builder-odroid-c2/releases/download/v0.4.1/hypriotos-odroid-c2-v0.4.1.img.zip

DIR=hypriotos
mkdir -p $DIR

curl -L https://github.com/hypriot/image-builder-odroid-c2/releases/download/$REL/$IMAGE.zip.sha256  -o $DIR/$IMAGE.zip.sha256
curl -L https://github.com/hypriot/image-builder-odroid-c2/releases/download/$REL/$IMAGE.zip         -o $DIR/$IMAGE.zip

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
ln -s $DIR/$IMAGE Image-04

exit 0

