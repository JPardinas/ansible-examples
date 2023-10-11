# ad-hoc

vagrant up --provision


# WSL venv creation
sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales
---reboot---

sudo apt-get install python-pip
pip3 install --upgrade pip
python3 -m venv ./venv --without-pip --system-site-packages
vim ~/.bashrc
export PATH="$PATH:/home/jpardinas/.local/bin"
source venv/bin/activate

sudo vim /etc/default/locale

# Hyperv network configuration
https://gist.github.com/savishy/8ed40cd8692e295d64f45e299c2b83c9

# command 
ansible multi -i inventory -a "hostname"
ansible multi -i inventory -a "hostname" -f 1
ansible multi -i inventory -a "df -h"
ansible multi -i inventory -a "free -h"
ansible multi -i inventory -a "date"
ansible -i inventory db -m setup
ansible -i inventory multi -b -m apt -a "name=ntp state=present"
ansible -i inventory multi --become -m apt -a "name=ntp state=present"
ansible -i inventory multi -K --become -m apt -a "name=ntp state=present"
ansible -i inventory multi --ask-become-pass --become -m apt -a "name=ntp state=present"

# https://docs.ansible.com/ansible/latest/collections/ansible/builtin/service_module.html
ansible -i inventory multi -m service -b -a "name=ntpd state=started enabled=yes"

ansible -i inventory multi -b -a "service ntpd stop"



ansible db -i inventory -a "free -m"


ansible app -i inventory -a "free -m" --limit "192.168.137.134"
ansible app -i inventory -a "free -m" --limit "*.168.137.134"


ansible-doc service

###

ansible -i inventory db -m mysql_user -a "name=django host=% password=12345 priv=*.*:ALL state=present"






# Background tasks
ansible -i inventory multi -b -B 3600 -P 0 -a "yum -y update"
ansible -i inventory db -b -m async_status -a "jid=12345"

# Show logs 
ansible -i inventory multi -b -a "tail -f /var/log/messages"
ansible -i inventory multi -b -a "tail -f /var/log/messages | grep ansible-command | wc -l" # this fails
ansible -i inventory multi -b -m shell -a "tail -f /var/log/messages | grep ansible-command | wc -l"

# Cron jobs
ansible -i inventory multi -b -m cron -a "name='ansible cron' minute='*/1' job='echo hello' state=present"
ansible -i inventory multi -b -m cron -a "name='ansible cron' minute='*/1' job='/path/to/script.sh' state=present"

# Git module
ansible -i inventory multi -b -m git -a "repo=github_url_repo dest=/opt/myapp update=yes version=1.0.0"