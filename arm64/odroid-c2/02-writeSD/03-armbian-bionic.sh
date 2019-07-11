#!/bin/bash
#
# write armbian bionic image to SD card

DEVICE=/dev/sdc

IMAGE=images/Image-03

ls -l $IMAGE
time dd if=$IMAGE of=$DEVICE bs=1M conv=fsync

sync ; sync
