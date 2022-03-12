#!/bin/bash

echo 'PLEASE NOTE: This script uses the ping command to test the TCP/IP layer and network connections. If your network or device firewall blocks pings, the results of this script will not be relevant.'

DEF_GATE=`ip r | grep 'default via' | awk '{print $3}'`
#Tests functionality of TCP/IP
TCP_IP_RES=`ping -c 1 127.0.0.1 | grep 'received' | cut -d, -f2 | awk '{print $1}'`
if [ $TCP_IP_RES > 0 ]; then
TCP_IP_STATE="Functional"
else
TCP_IP_STATE="Nonfunctional"
fi
echo "TCP/IP: $TCP_IP_STATE"
#Tests connection to the default gateway
DEF_GATE_RES=`ping -c 1 $DEF_GATE | grep 'received' | cut -d, -f2 | awk '{print $1}'`
if [ $DEF_GATE_RES > 0 ]; then
DEF_GATE_STATE="Functional"
else
DEF_GATE_STATE="Nonfunctional"
fi
echo "Default Gateway Connection: $DEF_GATE_STATE"
#Tests connection to remote server
REMOTE_SERV_RES=`ping -c 1 1.1.1.1 | grep 'received' | cut -d, -f2 | awk '{print $1}'`
if [ $REMOTE_SERV_RES > 0 ]; then
REMOTE_SERV_STATE="Functional"
else
REMOTE_SERV_STATE="Nonfunctional"
fi
echo "Internet Connection: $REMOTE_SERV_STATE"
