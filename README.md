# node-ansible
Ansible playbooks to setup Jury node.

### Config
ChainID, 后续需要去认证
mainnet -- 2000 
testnet -- 568 teddy

GasLimit 
0x1c9c380(3000 万, 和polygon一样), 需要分叉才能更改

GasPrice
每个节点打包交易的的最低price, 目前设置 100GWEI，随时可以修改配置

预挖账号 - 只需要一些, 用跨链资金还没跨过来之前的合约调用者的手续费
预挖账号分配数量 1000

验证者的质押门槛数量
资金桥管理者账号(1个)
资金桥签名者账号(3个)

Validator-Boot 节点账号 
4个初始节点，部署的时候自动生成，部署的时候需要安全维护


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
