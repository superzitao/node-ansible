#!/bin/bash
set -e

localip=$1
publicip=`curl --silent http://icanhazip.com`

nodeid=`grep Node init_secrets_output-*|awk '{print $NF}'`
outfile="secrets_nodeinfo_output-$localip"

# /ip4/172.51.0.11/tcp/1478/p2p/16Uiu2HAmR3rHnF8G8TMewrRC6U32Q3oPQtaBsj5va1UDciWZhVWd
echo "$publicip:$nodeid"
echo "/ip4/$publicip/tcp/1478/p2p/$nodeid" > $outfile
