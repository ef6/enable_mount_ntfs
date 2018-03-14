#!/bin/sh
diskutil list
echo "please select disk(eg. 1s2): \c"
read disk
disk="disk$disk"
sel_disk=`diskutil list | grep $disk`
if [ -n "$sel_disk" ]
then
    echo "Select $sel_disk"
else
    echo "Don't found $disk"
    exit 1
fi

if [ -d ~/$disk ]
then
    sudo umount /dev/$disk
    rm -rf ~/$disk
else
    mkdir ~/$disk
    sudo umount /dev/$disk
    sudo mount_ntfs -o rw,nobrowse /dev/$disk ~/$disk
    open ~/$disk
fi

