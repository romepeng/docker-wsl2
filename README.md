This requires WSL 2. 

Microsoft's has step-by-step instructions on how to upgrade to WSL 2.
https://docs.microsoft.com/en-us/windows/wsl/install-win10#step-2---update-to-wsl-2

Docker on WSL2 without Docker Desktop

wsl --update

wsl

nano /etc/wsl.conf
[boot]
systemctl=true

exit

wsl --shutdown

wsl

install docker && docker-compose

docker ps



