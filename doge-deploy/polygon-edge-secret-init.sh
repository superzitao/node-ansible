#!/bin/bash

if [ $# != 1 ]; then
	echo "Usage: $0 {{secrets-init-absolute-data-dir}}"
	exit 1
fi

INIT_DATA_DIR=${1%/}
P2P_DIR=$INIT_DATA_DIR/libp2p

if [ ! -d $P2P_DIR ]; then
	echo "$P2P_DIR not exists, try to init it"
else
	echo "$P2P_DIR exists, done"
	exit 0
fi

docker run --rm -v $INIT_DATA_DIR:$INIT_DATA_DIR 0xpolygon/polygon-edge:0.2.1 secrets init --data-dir $INIT_DATA_DIR
if [ $? != 0 ]; then
	echo "docker run polygon-edge secrets init failed"
	exit 2
fi
