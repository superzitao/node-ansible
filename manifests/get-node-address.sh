#!/bin/bash
set -e

localip=$1

nodeip=`curl --silent http://icanhazip.com`

address=`grep Public init_secrets_output-*|awk '{print $NF}'`
outfile="node_address_output-$localip"

# /ip4/172.51.0.11/tcp/1478/p2p/16Uiu2HAmR3rHnF8G8TMewrRC6U32Q3oPQtaBsj5va1UDciWZhVWd
echo "$localip:$address"
echo "$address" > $outfile
