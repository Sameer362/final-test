## Flask App on AWS EKS (CI/CD)

### Prerequisites
- AWS CLI & IAM Permissions
- Terraform Installed
- Jenkins Server with Docker
- kubectl + eksctl

### Steps
1. Use Terraform to provision EKS and ECR.
2. Push code to GitHub.
3. Jenkins will:
   - Build and push Docker image.
   - Deploy using `kubectl apply`.

### Files
- Dockerfile
- Jenkinsfile
- Terraform configs
- Kubernetes YAMLs
