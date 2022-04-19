#!/bin/bash
sudo apt update
if ! which docker > /dev/null; then
  sudo apt install -y docker.io
fi
sudo systemctl enable docker --now
# docker
# sudo usermod -aG docker $USER
newgrp docker
printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list ; curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg
# sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
sudo systemctl start docker.service
if [ ! $? -eq 0 ]; then
  # if systemctl not loaded SERVICE has to be used.  This is true for WSL
    sudo service docker start
    fi
sudo chmod 666 /var/run/docker.sock
sudo docker run hello-world
docker run -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy -t 2000 --itarmy --debug
