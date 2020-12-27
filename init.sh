#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3-dev git python-dev unzip python-pip awscli python-virtualenv
wget https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
unzip terraform_0.12.28_linux_amd64.zip
sudo mv terraform /usr/local/bin/
git clone https://github.com/splunk/attack_range && cd attack_range
cd terraform/aws
terraform init
cd ../..
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
cp attack_range.conf.template attack_range.conf
