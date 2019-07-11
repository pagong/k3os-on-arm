# How to run k3OS on single board computers with arm64 cpus.

## Useful hints for "overlay" installations

  - download the k3os rootfs TGZ
  - go to the directory for your SBC
    - download the desired OS image
    - write the IMG file to your SD card device
  - boot and initialize the OS
    - put SD card into your SBC
    - boot the SBC and let it initialize the OS
    - wait until it is finished
    - shutdown SBC and remove SD card
  - still in directory for your SBC
    - mount SD card filesystems
    - write and extract k3os TGZ to SD card
    - put additional config onto SD card
    - unmount SD card filesystems
  - boot SBC and watch k3os initialize

### Default users and passwords

| OS version | user name | initial password |
|------------|-----------|------------------|
| Raspbian   | pi        | raspberry        |
| Ubuntu for RPi | ubuntu   | ubuntu        |
| Hypriot-OS | pirate    | hypriot          |
| Armbian    | root      | 1234             |
| Hardkernel's Ubuntu | root     | odroid   |
| Hardkernel's Ubuntu | odroid   | odroid   |
| Archlinux  | root      | root             |
| Archlinux  | alarm     | alarm            |

