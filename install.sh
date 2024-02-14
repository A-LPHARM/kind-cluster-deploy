#!/bin/bash
# i am using linux redhat rather than windows to install all packages needed 
# this involves installing docker, kind, kubectl, terraform and helm using this script with a single command 

# install docker 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo su - ec2-user
docker ps

# installing kind on linux 
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind


# installing kind on windows

# curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.21.0/kind-windows-amd64
# Move-Item .\kind-windows-amd64.exe c:\kube\kind.exe



#install kubectl to confirm the pods are running and for troubleshooting and logging
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client



# install terraform 
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


# install helm needed to build the prometheus stack
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# when the packages and tools are completely installed then you create your cluster