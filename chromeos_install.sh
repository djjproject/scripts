#!/bin/sh
sudo apt-get update
sudo apt-get install pv
sudo apt-get install cgpt
sudo fdisk -l
read -p "enter disk name (example : /dev/sda) : " DISK
sudo bash chromeos-install.sh -src rammus_recovery.bin -dst $DISK
