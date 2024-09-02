#!/bin/bash
#set -x
echo "----------------------------"
echo "Get Docker Status:"
systemctl status docker | grep "Active"
echo "----------------------------"
echo "Get Docker Version"
docker version 2>/dev/null | grep "Version"
