#!/bin/bash
# Author Lyubomir Velikov
# Description Script to pull error messages from /var/log/messages


grep -i error /home/lyubo/bashscripting/Januaryi\ Scripts/messages > /home/lyubo/bashscripting/Januaryi\ Scripts/output-error

