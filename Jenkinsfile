pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    AWS_ACCOUNT_ID = '975050024946'
    ECR_REPO = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/final-submission"
    CLUSTER_NAME = 'flask-cluster'
    GIT_REPO = 'https://github.com/Sameer362/final-test'
  }

  stages {
    stage('Clone Repository') {
      steps {
        echo 'Cloning source code...'
        git "${GIT_REPO}"
      }
    }

    stage('Build Docker Image') {
      steps {
        echo 'Building Docker image...'
        sh 'docker build -t flask-app .'
      }
    }

    stage('Push to Amazon ECR') {
      steps {
        echo 'Logging  and pushing image to ECR...'
        sh '''
          aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO}
          docker tag flask-app:latest ${ECR_REPO}:latest
          docker push ${ECR_REPO}:latest
        '''
      }
    }

    stage('Deploy to Amazon EKS') {
      steps {
        echo 'Deploying to EKS cluster...'
        sh '''
          aws eks --region ${AWS_REGION} update-kubeconfig --name ${CLUSTER_NAME}
          kubectl apply -f k8s/deployment.yaml
          kubectl apply -f k8s/service.yaml
        '''
      }
    }
  }
}
