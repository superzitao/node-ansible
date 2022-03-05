#!/usr/bin/env sh

NODE_DIR=${NODE_DIR:-$HOME/jury-install}
USER=$(whoami)


cat > jury.service <<EOF
[Unit]
  Description=jury
  StartLimitIntervalSec=500
  StartLimitBurst=5

[Service]
  Restart=on-failure
  RestartSec=5s
  WorkingDirectory=$NODE_DIR
  ExecStartPre=/bin/chmod 0755 /usr/bin/jury
  ExecStart=/usr/bin/jury server --data-dir /data/jury --chain $NODE_DIR/genesis.json --grpc 0.0.0.0:9632 --libp2p 0.0.0.0:1478 --jsonrpc 0.0.0.0:8545 --price-limit=100 --seal --log-level debug
  Type=simple
  User=$USER
  KillSignal=SIGINT
  TimeoutStopSec=120

[Install]
  WantedBy=multi-user.target
EOF
