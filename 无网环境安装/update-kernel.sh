#!/bin/bash

KERNEL=`uname -r`

if [ $KERNEL = 3.10.5-3.el6.x86_64 ]; then
	exit;
else
	cd kernel/;
	rpm -ivh kernel-ml-aufs-devel-3.10.5-3.el6.x86_64.rpm;
	rpm -ivh kernel-ml-aufs-3.10.5-3.el6.x86_64.rpm;
	echo "Please change /etc/grub.conf (default=1) to (default=0)"
	echo "After the completion of the change to （reboot) the machine"
fi
