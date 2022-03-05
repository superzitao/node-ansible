# node-ansible
Ansible playbooks to setup Jury node.

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

```
