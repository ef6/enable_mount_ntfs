#!/bin/sh
sudo -s
mv /sbin/mount_ntfs /sbin/mount_ntfs_orig
echo '#!/bin/bash' > /sbin/mount_ntfs
echo 'for arg in $@;' >> /sbin/mount_ntfs
echo 'do if [ $(echo $arg |grep -c "/dev/") == 1 ]; then disk=$arg; fi;' >> /sbin/mount_ntfs
echo 'if [ $(echo $arg |grep -c "/Volumes/") == 1 ]; then volume="$arg"; fi;done' >> /sbin/mount_ntfs
echo 'mount_ntfs_orig -o rw,auto,nobrowse $disk "$volume"' >> /sbin/mount_ntfs
chmod a+x /sbin/mount_ntfs
ln -s /Volumes ~/磁盘
exit 0

