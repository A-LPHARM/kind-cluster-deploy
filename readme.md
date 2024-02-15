# Build Your Simple Node Application

To build and deploy your simple Node.js application, i will need the following requirements installed on your system:

1. **Docker Desktop:**
   - Install Docker Desktop on Linux:

     ```bash
     sudo yum install -y yum-utils
     sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
     sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y docker-compose-plugin
     sudo systemctl start docker
     sudo usermod -a -G docker ec2-user
     sudo su - ec2-user
     docker ps
     ```

2. **Kind (Kubernetes in Docker):**
   - Install Kind:

     ```bash
     # For AMD64 / x86_64
     [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
     # For ARM64
     [ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-arm64
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

    ```
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
     ```

Make sure to verify the installation of each tool after running the respective commands.

## First Step: Docker Image and Deployment to Docker Hub

1. Create the Dockerfile.
2. Build the Docker image:

   ```bash
   docker build . -t henriksin1/node-app:v1
   ```

3. Login to Docker Hub:

   ```bash
   docker login -u henriksin1
   ```

4. Push the Docker image:

   ```bash
   docker push henriksin1/node-app:v1
   ```

Now, i can use the image to build my deployment resources in Kubernetes.

## Second Step: Terraform and Kubernetes Deployment

1. After Preparing my Terraform file and Kubernetes manifest file for the Node.js application.
2. Run Terraform commands:

   ```bash
   terraform init
   terraform apply -auto-approve
   ```

3. Confirm by running:

   ```bash
   kubectl get pods
   ```

## Third Step: Prometheus Stack Deployment

1. change directory to the `prometheus-stack` directory.
2. add the Prometheus Community Helm repository:

   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

3. after building my Terraform file:

   ```bash
   terraform init
   terraform apply -auto-approve
   ```

Now you have all the necessary tools to build and deploy your simple Node.js and prometheus application using Docker, Kind, kubectl, Terraform, and Helm. Follow the instructions for the application deployment using these tools.
```