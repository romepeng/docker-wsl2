This requires WSL 2. 

Microsoft's has step-by-step instructions on how to upgrade to WSL 2.
https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-2---update-to-wsl-2

Docker on WSL2 without Docker Desktop

how to run Docker on WSL2 under Windows without Docker Desktop (Debian / Ubuntu)?

<https://dev.solita.fi/2021/12/21/docker-on-wsl2-without-docker-desktop.html> 


Install Docker on Windows (WSL) without Docker Desktop

https://dev.to/bowmanjd/install-docker-on-windows-wsl-without-docker-desktop-34m9
https://github.com/bowmanjd/docker-wsl

.Instead of using an init system such as systemd to launch the Docker daemon, launch it by calling dockerd manually.

.If sharing the Docker daemon between WSL instances is desired, configure it to use a socket stored in the shared /mnt/wsl directory.

.If sharing and privileged access without sudo are desired, configure the docker group to have the same group ID across all WSL instances

.Rather than launch a Windows-based Docker client, launch docker inside WSL.
