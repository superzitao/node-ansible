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
        --block-gas-limit 0x1c9c380 \
        --premine=0x0Ea680527b44D598804c4a85C5d6695d2dd1Ef51:0x3635c9adc5dea00000 \
        --bridge-owner=0x88d150fDa9258e50a5eE1D58afAc966CA88d60BB \
        --bridge-signer=0xC45312Ab8aD61740eeD4B33AEc7884bEe2d57d9d \
        --bridge-signer=0x3c12F74636B2888BdDe8BdE0489c0DC0a47BbfeC \
        --bridge-signer=0xc4C8c8Aa917993e42E0d9e94BF6561efCF5a341f \
        --proposer-profit-molecular=800000000 \
        --chainid 568 
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