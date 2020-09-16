#!/bin/bash

#installation
sudo apt-get update
sudo apt install nfs-kernel-server

#creating directory
sudo mkdir -p /nfs/general
sudo mkdir -p /nfs/home

#Connecting Host
echo "Enter Host IP:"
read host
echo "Mounting... Please Wait!"

sudo mount $host:/var/nfs/general /nfs/general
sudo mount $host:/home /nfs/home

#check Status

df -h

#Output should look like
#Filesystem                Size  Used Avail Use% Mounted on
#udev                      238M     0  238M   0% /dev
#tmpfs                      49M  628K   49M   2% /run
#/dev/vda1                  20G  1.2G   18G   7% /
#tmpfs                     245M     0  245M   0% /dev/shm
#tmpfs                     5.0M     0  5.0M   0% /run/lock
#tmpfs                     245M     0  245M   0% /sys/fs/cgroup
#tmpfs                      49M     0   49M   0% /run/user/0
#203.0.113.0:/home      20G  1.2G   18G   7% /nfs/home
#203.0.113.0:/var/nfs/general   20G  1.2G   18G   7% /nfs/general

du -sh /nfs/home
#Size of directory Output ashbe, Look like

#400MB /nfs/home


#Testing Access
sudo touch /nfs/general/general.test
ls -l /nfs/general/general.test

#output should look like

#-rw-r--r-- 1 nobody nogroup 0 Nov  1 13:31 /nfs/general/general.test

sudo touch /nfs/home/home.test
ls -l /nfs/home/home.test

#output should like

#-rw-r--r-- 1 root root 0 Aug  1 13:32 /nfs/home/home.test

#Mounting Server Directory
sudo nano /etc/fstab

#Edit the file at LAST OF THE FILE(IMPORTANT) like this

#. . .
#(Host IP):/var/nfs/general    /nfs/general   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
#(Host IP):/home       /nfs/home      nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0



