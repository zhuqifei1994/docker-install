#!/bin/bash
KERNEL=`uname -r`

if [ $KERNEL = 3.10.5-3.el6.x86_64 ];then
	continue
else
	echo "Please perform before executing the script (sh update-kernel.sh)"
	exit
fi


if [ ! -d "$PWD/docker-package/docker" ]; then
        cd docker-package/
        tar -zxvf docker-17.05.0-ce.tgz
        cd docker
        cp docker* /usr/bin/
        
        cd ../..
        rpm -ivh cgconfig/libcgroup-0.40.rc1-23.el6.x86_64.rpm

        cp file/docker-conf /etc/sysconfig/docker
        cp file/docker-start /etc/rc.d/init.d/docker

        /etc/init.d/cgconfig restart
        service docker restart
else
        exit
fi