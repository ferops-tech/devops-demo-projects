#!/bin/bash

# -----------------------------------------------------------------------------
# startup.sh
# Bootstrap script for EC2 instance
# - Installs Docker, Kubernetes tooling, k3d, Helm, and Git
# - Configures Docker daemon and adds ec2-user to docker group
# - Creates a k3d Kubernetes cluster and sets up kubeconfig
# - Enables bash completions for kubectl, k3d, and Helm
# - Clones repository and prepares ArgoCD for GitOps deployments
# -----------------------------------------------------------------------------
#!/bin/bash

set -e  # Exit immediately if a command fails

# ---------------------------------------------------
# Install docker (command works on official AMI - Amazon Linux 2023)
# ---------------------------------------------------
dnf install -y docker
systemctl enable docker --now
usermod -aG docker ec2-user

# ---------------------------------------------------
# Install Kubectl
# ---------------------------------------------------
cat <<EOF | tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.34/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.34/rpm/repodata/repomd.xml.key
EOF
dnf install -y kubectl
dnf install -y bash-completion
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
chmod a+r /etc/bash_completion.d/kubectl

# ---------------------------------------------------
# Install k3d
# ---------------------------------------------------
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d completion bash | tee /etc/bash_completion.d/k3d > /dev/null

# ---------------------------------------------------
# Install Helm
# ---------------------------------------------------
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm completion bash | tee /etc/bash_completion.d/helm > /dev/null

# ---------------------------------------------------
# Install git
# ---------------------------------------------------
dnf install git -y

# ---------------------------------------------------
# Deploy cluster
# ---------------------------------------------------
k3d cluster create demo-devops -p "80:80@loadbalancer" -p "30080:30080@loadbalancer" --agents 2 --wait

# ---------------------------------------------------
# Prepare kubernetes usage for user ec2-user
# ---------------------------------------------------
mkdir -p /home/ec2-user/.kube
k3d kubeconfig get demo-devops > /home/ec2-user/.kube/config
chown ec2-user:ec2-user /home/ec2-user/.kube/config
chmod 600 /home/ec2-user/.kube/config
tee -a /home/ec2-user/.bashrc <<'EOF'
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k
EOF
chown ec2-user:ec2-user /home/ec2-user/.bashrc

# ---------------------------------------------------
# Prepare ArgoCD Deployment
# ---------------------------------------------------
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

# ---------------------------------------------------
# Deployed ArgoCD using custom values:
# ---------------------------------------------------
git clone https://github.com/ferops-tech/devops-demo-projects.git
helm install argocd argo/argo-cd -n argocd --values devops-demo-projects/demo-gitops-argocd/argocd/values.yaml --create-namespace

# ---------------------------------------------------
# Deploy custom app
# ---------------------------------------------------
#helm install -n flask-ns demo-devops devops-demo-projects/demo-kubernetes-orchestration/helm/flask-app  -f devops-demo-projects/demo-kubernetes-orchestration/helm/flask-app/values-eks.yaml --set ingress.className=traefik --create-namespace
