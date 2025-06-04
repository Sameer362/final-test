pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    ECR_REPO = '<your_aws_account_id>.dkr.ecr.${AWS_REGION}.amazonaws.com/flask-app'
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/your-user/flask-eks-app.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t flask-app .'
      }
    }

    stage('Push to ECR') {
      steps {
        sh '''
        aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
        docker tag flask-app:latest $ECR_REPO:latest
        docker push $ECR_REPO:latest
        '''
      }
    }

    stage('Deploy to EKS') {
      steps {
        sh '''
        aws eks --region $AWS_REGION update-kubeconfig --name flask-cluster
        kubectl apply -f k8s/deployment.yaml
        kubectl apply -f k8s/service.yaml
        '''
      }
    }
  }
}
