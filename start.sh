#!/bin/bash

if [ ! -z "$ROOT_PASSWORD" ]; then
    echo root:$ROOT_PASSWORD | chpasswd
    unset ROOT_PASSWORD
fi

if [ ! -z "$ROOT_PUB_KEY" ]; then
    sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
    echo "$ROOT_PUB_KEY" > /root/.ssh/authorized_keys
    unset ROOT_PUB_KEY
fi

/usr/sbin/sshd -D