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


• To always run dockerd automatically
• Add the following to .bashrc or .profile (make sure “DOCKER_DISTRO” matches your distro, you can check it by running “wsl -l -q” in Powershell)

DOCKER_DISTRO="Ubuntu-20.04"
DOCKER_DIR=/mnt/wsl/shared-docker
DOCKER_SOCK="$DOCKER_DIR/docker.sock"
export DOCKER_HOST="unix://$DOCKER_SOCK"
if [ ! -S "$DOCKER_SOCK" ]; then
   mkdir -pm o=,ug=rwx "$DOCKER_DIR"
   sudo chgrp docker "$DOCKER_DIR"
   /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
fi
• To manually run dockerd
• Add the following to your .bashrc or .profile

DOCKER_SOCK="/mnt/wsl/shared-docker/docker.sock"
test -S "$DOCKER_SOCK" && export DOCKER_HOST="unix://$DOCKER_SOCK"
Want to go passwordless with the launching of dockerd?
All you need to do is
• sudo visudo
• %docker ALL=(ALL) NOPASSWD: /usr/bin/dockerd
Enable / disable BuildKit (optional)
You may end up wanting to enable/disable BuildKit depending on your use cases (basically to end up with the classic output with Docker), and the easiest way for this is to just add the following to your .bashrc or .profile

   export DOCKER_BUILDKIT=0
   export BUILDKIT_PROGRESS=plain
Adding some finishing touches
To wrap things up, you most likely will want to install docker-compose. You can start by checking up the number of the latest stable version from the Docker Compose documentation and doing the following (we’ll be using version 1.29.2 in this example)
• COMPOSE_VERSION=1.29.2
• sudo curl -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
• sudo chmod +x /usr/local/bin/docker-compose
![image](https://user-images.githubusercontent.com/15272552/158351970-5578b5ef-ea64-4e1a-ab22-b60c38b6abb5.png)
