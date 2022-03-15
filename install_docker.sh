#!/bin/bash

# remove old docker version
sudo apt remove docker docker-engine docker.io containerd runc

# 安装Docker
# step 1: 安装必要的一些系统工具
sudo apt -y update
sudo apt -y install --no-install-recommends apt-transport-https ca-certificates curl gnupg2 software-properties-common

# step 2: 安装GPG证书
source/etc/os-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo apt-key add -
#curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -

# Step 3: 写入软件源信息
sudo  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${lsb_release  -cs} stable"
#sudo tee /etc/apt/sources.list.d/docker.list
#sudo add-apt-repository "deb [arch=amd64] https://mirrors.cloud.tencent.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

# Step 4: 更新并安装Docker-CE
sudo apt -y update
sudo apt install docker-ce docker-ce-cli containerd.io
#sudo apt -y install docker-ce

# Step 5: 非root用户操作docker
### 官方说明里的设置方法，开始 ###
# 这种方法的好处是docker不用重启
sudo groupadd docker
sudo usermod -aG docker $USER

