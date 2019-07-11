#!/bin/bash
#
# download archlinux for odroid-c2

#IMAGE=ArchLinuxARM-odroid-c2-latest
IMAGE=ArchLinuxARM-2019.06-odroid-c2-rootfs

#http://os.archlinuxarm.org/os/ArchLinuxARM-odroid-c2-latest.tar.gz
#http://de6.mirror.archlinuxarm.org/os/amlogic/ArchLinuxARM-2019.06-odroid-c2-rootfs.tar.gz

DIR=archlinux
mkdir -p $DIR

curl -L http://os.archlinuxarm.org/os/amlogic/$IMAGE.tar.gz.md5  -o $DIR/$IMAGE.tar.gz.md5
curl -L http://os.archlinuxarm.org/os/amlogic/$IMAGE.tar.gz      -o $DIR/$IMAGE.tar.gz

cd $DIR

SUM=$( md5sum $IMAGE.tar.gz )
sum1=$( echo $SUM | cut -d' ' -f 1)

sum2=$( grep -h $IMAGE $IMAGE.tar.gz.md5 | cut -d' ' -f1 )


if [ "$sum1" = "$sum2" ] ; then
    echo "Download OK!"
else
    echo "BAD Download !!!"
    exit 1
fi

cd ..
ln -s $DIR/$IMAGE.tar.gz RootFS-05

exit 0

