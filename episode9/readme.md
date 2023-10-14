# SSH configuration

cat /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep -v "^#" | grep -v "^$"

systemctl status sshd

# Connect to ssh using new port

ssh -p 2849 centos@ip

# sudoers file

sudo cat /etc/sudoers


# check open ports

nmap ip

# geerlingguy security role

galaxy.ansible.com/geerlingguy/security