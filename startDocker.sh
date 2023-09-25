#!/bin/bash
run=$(systemctl show --property ActiveState docker)
if [[ $(id -u) -eq 0 ]]
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
else
  if sudo -v 1>/dev/null 2>/dev/null
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
  else
  echo "You do NOT have permissions to start Docker. Please run this script with sudo permissions"
  fi
fi
