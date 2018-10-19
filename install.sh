sudo yum install -y epel-release
sudo yum install -y gcc python-pip python-devel openssl-devel
sudo pip install --upgrade pip
sudo pip install molecule
ansible --version
molecule --version
sudo curl -fsSL https://goss.rocks/install | sudo GOSS_DST=/usr/local/sbin sh
goss --version
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo docker version
sudo docker run hello-world
#sudo pip install docker-py
