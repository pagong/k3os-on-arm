#!/bin/bash
#
# write ubuntu-18.04 minimal image to SD card

DEVICE=/dev/sdc

IMAGE=images/Image-01

ls -l $IMAGE
time dd if=$IMAGE of=$DEVICE bs=1M conv=fsync

sync ; sync
