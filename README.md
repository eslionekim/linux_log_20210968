# linux_log_20210968
리눅스 로그 저장소

WEEK 9 : practice

1. cp /etc/fstab fstab_back
mkdir /mnt/mydisk
blkid -> UUID copy
gedit /etc/fstab

UUID=uuid paste   /mnt/mydisk   ext4   default   0   2 -> save

mount -a -> no error -> success
df -h -> check

2. new scsi -> 1GB VDI 2-> name: RAID0.vdi , RAID1.vdi

fdisk -l -> RAID0.vdi , RAID1.vdi check
fdisk /dev/sdc -> n->p->t->fd->p->w , sdd same
mdadm --create /dev/md/raid0 --level=0 -raid-devices=2 dev/sdd1 /dev/sdc1
mdadm --detail --scan
mkfs.ext4 /dev/md/raid0
mkdir /new_raid0
mount /dev/md/raid0 /new_raid0/
df -h
