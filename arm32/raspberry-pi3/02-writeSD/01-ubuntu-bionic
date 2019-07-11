#!/bin/bash
#
# write ubuntu bionic image to SD card

DEVICE=/dev/sdc

IMAGE=images/Image-01

ls -l $IMAGE
time dd if=$IMAGE of=$DEVICE bs=1M conv=fsync

sync ; sync
