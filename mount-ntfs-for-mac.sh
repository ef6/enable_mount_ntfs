#!/bin/sh
sudo -s
mv /sbin/mount_ntfs /sbin/mount_ntfs_orig
echo '#!/bin/bash' > /sbin/mount_ntfs
echo 'mount_ntfs_orig -o rw,auto,nobrowse $7 "$8"' >> /sbin/mount_ntfs
chmod a+x /sbin/mount_ntfs
ln -s /Volumes ~/磁盘
exit 0

