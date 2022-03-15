# Configure dockerd

• DOCKER_DIR=/mnt/wsl/shared-docker

• mkdir -pm o=,ug=rwx "$DOCKER_DIR"

• sudo chgrp docker "$DOCKER_DIR"

• sudo mkdir /etc/docker

• sudo vi /etc/docker/daemon.json

# add 

{
   "hosts": ["unix:///mnt/wsl/shared-docker/docker.sock"]
}

