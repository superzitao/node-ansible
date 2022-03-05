#!/bin/bash

ROOT_DIR=/data/zcc-test-2
WORK_DIRS=(test-chain-1 test-chain-2 test-chain-3 test-chain-4)

for (( i=0; i<${#WORK_DIRS[@]}; i++ ))
do
	cd $ROOT_DIR/${WORK_DIRS[i]}
	rm -rf blockchain trie keystore
	rm consensus/metadata consensus/snapshots
done

