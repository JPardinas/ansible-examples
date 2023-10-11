# Vault

ansible-vault encrypt vars/api_key.yml
ansible-vault decrypt vars/api_key.yml
ansible-vault edit vars/api_key.yml
ansible-vault rekey vars/api_key.yml

ansible-playbook playbooks/main.yml --ask-vault-pass


ansible-playbook playbooks/main.yml --ask-vault-pass --tags "api_key"