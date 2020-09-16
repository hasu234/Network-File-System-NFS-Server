#!/bin/bash

#nfs-kernal-sarver install
sudo apt-get update
sudo apt-install nfs-kernel-server

#Making Sharable directory
sudo mkdir /var/nfs/general -p
ls -la /var/nfs/general

sudo chown nobody:nogroup /var/nfs/general

#set up sharing
sudo nano /etc/exports

#Edit the file with below command
#/var/nfs/general    "client IP Here"(rw,sync,no_subtree_check)
#/home       "Client IP Here"(rw,sync,no_root_squash,no_subtree_check)

#restart nfs Server
sudo systemctl restart nfs-kernel-server

#adjusting Firewall
sudo ufw enable
sudo default deny
sudo iptables -L

sudo ufw status

#Output should be
#To                         Action      From
#--                         ------      ----
#OpenSSH                    ALLOW       Anywhere
#OpenSSH (v6)               ALLOW       Anywhere (v6)


#Giving Access
echo "Enter Client IP: "
read ip

sudo ufw allow from $ip to any port nfs


#Varify Status

sudo ufw status 


#Output should like

#Status: active

#To                         Action      From
#--                         ------      ----
#OpenSSH                    ALLOW       Anywhere                 
#2049                       ALLOW       203.0.113.24        
#OpenSSH (v6)               ALLOW       Anywhere (v6)


