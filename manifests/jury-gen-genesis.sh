#!/bin/bash
set -e

bootnodes=`cat secrets_nodeinfo_output/secrets_nodeinfo_output-*`
echo $bootnodes

addresses=`cat secrets_nodeinfo_output/node_address_output-*`
echo $addresses

cmd="jury genesis \
        --name doge \
        --consensus ibft \
        --pos \
        --epoch-size 50 \
        --premine=0x4f87e677d1244fc776e62289e8e4d44ff51b969f:0x1431e0fae6d72100000000000 \
        --proposer-profit-molecular=800000000 \
        --chainid 1681 
"

echo "org cmd:"
echo "$cmd"

for bootnode in ${bootnodes[@]}
do
        echo $bootnode
        cmd="$cmd --bootnode $bootnode"
done

for address in ${addresses[@]}
do
        echo $address
        cmd="$cmd --ibft-validator $address"
done

# addressArray=""

# num=1
# for address in ${addresses[@]}
# do
#         echo $address
#         if [ "$num" -eq 1 ]
#         then
#                 addressArray="$address"
#         else
#                 addressArray="$addressArray,$address"
#         fi
#         num=$(( $num + 1 ))
# done
# echo "addressArray: $addressArray"

# cmd="$cmd --ibft-validator $addressArray"

echo "$cmd"

$cmd