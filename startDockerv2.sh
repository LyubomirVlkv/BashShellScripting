#!/bin/bash
run=$(systemctl show --property ActiveState docker)
if [[ $(id -u) -eq 0 ]] || sudo -v 1>/dev/null 2>/dev/null
then
        if [[ $run == "ActiveState=active" ]]
        then
          echo "Docker is active"
        else
          echo "Starting docker"
          systemctl start docker
          echo "===================="
        if [[ $run == "Activestate=inactive" ]]
        then
                echo "Cannot start docker!"
        else
                echo "Docker is running!"
        fi

        fi
fi


