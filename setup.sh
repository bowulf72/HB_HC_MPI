#!/bin/bash
set -x
exit

#disable_selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/I' /etc/selinux/config
setenforce 0

adminUsername=${1}
adminPassword=${2}
VMPREFIX=${3}
NODECOUNT=${4}

#give all the nodes time to complete spinning up
sleep 60

configure_ssh() {
    
    yum -y install sshpass
    su -c "ssh-keygen -t rsa -f /home/$adminUsername/.ssh/id_rsa -q -P ''" - $adminUsername
    
    index=1    
    while [ $index -le $(($NODECOUNT)) ]; do
        SSHCOMMAND="su -c 'sshpass -p $adminPassword ssh-copy-id -i /home/$adminUsername/.ssh/id_rsa -o StrictHostKeyChecking=no -o ConnectTimeout=2 $adminUsername@$VMPREFIX$index -p 22' - $adminUsername"
        eval $SSHCOMMAND 
        let index++
    done
}

configure_ssh
