#!/bin/bash
#
# write armbian buster image to SD card

DEVICE=/dev/sdc

IMAGE=images/Image-02

ls -l $IMAGE
time dd if=$IMAGE of=$DEVICE bs=1M conv=fsync

sync ; sync
