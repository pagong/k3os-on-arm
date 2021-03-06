#!/bin/bash
#
# download k3os rootfs for arm64

REL="v0.2.1"
mkdir -p $REL

curl -L  https://github.com/rancher/k3os/releases/download/$REL/sha256sum-arm64.txt        -o  $REL/k3os-sha256sum-arm64.txt
curl -L  https://github.com/rancher/k3os/releases/download/$REL/k3os-rootfs-arm64.tar.gz   -o  $REL/k3os-rootfs-arm64.tgz

SUM=$( sha256sum $REL/k3os-rootfs-arm64.tgz )
sum1=$( echo $SUM | cut -d' ' -f 1)

sum2=$( grep -h k3os-rootfs-arm64.tar $REL/k3os-sha256sum-arm64.txt | cut -d' ' -f1 )

if [ "$sum1" = "$sum2" ] ; then
    echo "Download OK!"
else
    echo "BAD Download !!!"
    exit 1
fi

ln -sf $REL/k3os-rootfs-arm64.tgz k3os-arm64.tgz

exit 0
