#!/bin/bash

. ./ufw_defaults.sh

ufw disable
ufw default deny incoming
ufw default allow outgoing

if [ "$allow_ssh" -eq "yes" ]; then
    echo "[ufw_init]: ssh is set to be allowed, adding rule for ssh"
    if [ ufw allow ssh ]; then
        echo "[ufw_init]: ssh is set to be allowed, adding rule for ssh"
    fi
fi

    


ufw allow $ssh_port


if [ "$allow_http" -eq "yes"]; then
    echo "[ufw_init]: http is set to be allowed, adding rule for http"
    if [ ufw allow http ]; then
        echo "[ufw_init]: http port has been opened"
    fi
fi 

if [ "$allow_https" -eq "yes"]; then
    echo "[ufw_init]: https is set to be allowed, adding rule for https"
    if [ ufw allow https ]; then
        echo "[ufw_init]: https port has been opened"
    fi
fi 





ufw enable
ufw status verbose

