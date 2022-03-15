# node-ansible
Ansible playbooks to setup Jury node.

### Config
ChainID
mainnet -- 1680 
testnet -- 1681

GasLimit 
0x1c9c380(3000 万, 和 polygon 一样), 需要分叉才能更改

GasPrice
每个节点打包交易的的最低price, 目前设置100，随时可以修改配置

预挖账号
预挖账号分配数量 1000
验证者的质押门槛数量
资金桥管理者账号
资金桥签名者账号

Validator-Boot 账号 -- 4个初始节点，部署的时候自动生成，部署的时候需要安全维护


### Requirements

Make sure you are using python3.x with Ansible. To check: `ansible --version` 

```bash

# build jury on build-node
ansible-playbook -l build playbooks/build-jury.yml

# init secrets on each boot node
ansible-playbook -l boot  playbooks/config-secrets.yml

# generate genesis.json on build node
ansible-playbook -l build playbooks/gen-genesis.yml

# start jury service on boot node
ansible-playbook -l boot playbooks/start-bootnode.yml


ansible-playbook -l boot playbooks/clear.yml

```
