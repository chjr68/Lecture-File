#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt -y update
apt -y install net-tools
apt -y install nfs-common

echo "sudo -i" >> /home/ubuntu/.bashrc
