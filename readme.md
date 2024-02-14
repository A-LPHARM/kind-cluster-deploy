# Build Your Simple Node Application

To build and deploy your simple Node.js application, you'll need the following requirements installed on your system:

1. **Docker Desktop:**
   - Install Docker Desktop on Linux:

     ```bash
     sudo yum install -y yum-utils
     sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
     sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
     sudo systemctl start docker
     sudo usermod -a -G docker ec2-user
     sudo su - ec2-user
     docker ps
     ```

2. **Kind (Kubernetes in Docker):**
   - Install Kind:

     ```bash
     # For AMD64 / x86_64
     [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
     # For ARM64
     [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-arm64
     chmod +x ./kind
     sudo mv ./kind /usr/local/bin/kind
     ```

3. **kubectl (Kubernetes Command-Line Tool):**
   - Install kubectl:

     ```bash
     curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
     curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
     echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
     sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
     kubectl version --client
     ```

4. **Terraform:**
   - Install Terraform:

     ```bash
     sudo yum install -y yum-utils
     sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
     sudo yum -y install terraform
     ```

5. **Helm:**
   - Install Helm:

     ```bash
     curl -LO https://git.io/get_helm.sh
     chmod 700 get_helm.sh
     ./get_helm.sh
     ```

Make sure to verify the installation of each tool after running the respective commands.

Now you have all the necessary tools to build and deploy your simple Node.js application using Docker, Kind, kubectl, Terraform, and Helm. Follow the instructions for your application deployment using these tools.