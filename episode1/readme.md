ansible -i inventory test_group -m ping -u centos
ansible test_group -m ping -u centos
ansible test_group -m command -a date -u centos
ansible test_group -a date -u centos