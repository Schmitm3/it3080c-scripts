#!/bin/bash
# This script outputs the IP address and hostname of a machine

echo 'This is a script. Hello!'
echo Machine Type: $MACHTYPE
echo Hostname: $HOSTNAME
echo Working Dir: $PWD
echo Session Length: $SECONDS
echo Home Dir: $HOME

a=$(ip a | grep 'dynamic ens192' | awk '{print $2}')
echo My IP address is $a
