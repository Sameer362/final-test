What This Project Does
This project shows how to automatically build, push, and deploy a Flask application on an AWS Elastic Kubernetes Service (EKS) cluster using Jenkins and Terraform.

Prerequisites (What You Need)
AWS CLI installed and configured with permissions to create EKS, ECR, and related resources.

Terraform installed (to provision infrastructure like EKS and ECR).

A Jenkins server with Docker installed (to build and push Docker images).

kubectl (Kubernetes CLI) and eksctl (optional) installed to manage EKS cluster.

Access to a GitHub repository with your Flask app code and config files.

How It Works (Step-by-Step)
Provision Infrastructure
Use Terraform scripts to create:

An EKS Kubernetes cluster

An ECR (Elastic Container Registry) repository for Docker images

Push Code to GitHub
Your Flask app code, Dockerfile, Kubernetes manifests, and Jenkinsfile are stored in a GitHub repo.

Jenkins Pipeline
When Jenkins detects new code:

It clones the repo

Builds the Flask Docker image

Pushes the image to the AWS ECR repository

Deploys the new image to the EKS cluster using Kubernetes manifests

Important Files in This Project
Dockerfile — Defines how to build your Flask app container image.

Jenkinsfile — Automates the CI/CD pipeline steps in Jenkins.

Terraform files — Provision AWS infrastructure (EKS cluster, VPC, ECR repo).

Kubernetes YAML files (deployment.yaml, service.yaml) — Describe how to deploy your app on Kubernetes.

How to Use
Set up AWS CLI with proper permissions.

Run terraform init and terraform apply to create AWS infrastructure.

Push your app code and config files to GitHub.

Configure Jenkins with the pipeline to build, push, and deploy.

Monitor Jenkins builds and verify your app running on EKS.

