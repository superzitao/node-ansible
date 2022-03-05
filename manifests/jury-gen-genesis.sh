#!/bin/bash
set -e

bootnodes=`cat secrets_nodeinfo_output/secrets_nodeinfo_output-*`
echo $bootnodes

cmd="jury genesis \
        --name doge \
        --consensus ibft \
        --pos \
        --epoch-size 50 \
        --ibft-validators-prefix-path test-chain- \
        --premine=0x32fC6Db2B0500fF103A810B46Daa26d35CE5172f:1000000000000000000000 \
        --premine=0x69a8a1f93c0382b0e3814c2c05659AfE178538f8:1000000000000000000000 \
        --premine=0x809D784eF89CC0378FfcF41775ea8e358dcA168F:1000000000000000000000 \
        --premine=0x4faA20e162e4d026dC006197F4c94A9219c5fb75:1000000000000000000000 \
        --premine=0x1b4297618913C492179C308322Aa6e66daF625D4:1000000000000000000000 \
        --premine=0xa39b6aA2CD5139bA742f9D9cd4a72458D78d5c4E:1000000000000000000000 \
        --premine=0xeeA13dF426dcF62999B9bFf912f58E25f4f9Ba2f:1000000000000000000000 \
        --premine=0x6067a1C57913Fd5aB883453fA86F50bF7Ce0A14C:1000000000000000000000 \
        --premine=0xFB38D2D7A0d6a3623359760E404bcdee841A11E8:1000000000000000000000 \
        --proposer-profit-molecular=800000000 \
        --chainid 1681 
"

echo "org cmd:"
echo "$cmd"

for bootnode in ${bootnodes[@]}
do
        echo $element
        cmd="$cmd --bootnode $bootnode"
done

echo "$cmd"

$cmd