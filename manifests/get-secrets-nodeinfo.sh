#!/bin/bash
set -e

nodeip=$1 

nodeid=`grep Node init_secrets_output-*|awk '{print $NF}'`
outfile="secrets_nodeinfo_output-$nodeip"

# /ip4/172.51.0.11/tcp/1478/p2p/16Uiu2HAmR3rHnF8G8TMewrRC6U32Q3oPQtaBsj5va1UDciWZhVWd
echo "$nodeip:$nodeid"
echo "/ip4/$nodeip/tcp/1478/p2p/$nodeid" > $outfile
