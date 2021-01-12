parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary 0% 100%
mkfs.xfs /dev/sdb1
mkdir /mnt/data1
if grep -Fxq "sdb1" /etc/fstab
then
  echo 'sdb1 exist in fstab'
else
  echo `blkid /dev/sdb1 | awk '{print$2}' | sed -e 's/"//g'` /mnt/data1   xfs   noatime,nobarrier   0   0 >> /etc/fstab
fi
if mount | grep /mnt/data1 > /dev/null; then
  echo "/dev/sdb1 mounted /mnt/data1"
  umount /mnt/data1
  mount /mnt/data1
else
  mount /mnt/data1
fi