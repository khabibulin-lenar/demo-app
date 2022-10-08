pipeline {

    agent any

    environment {
        MY_AWS_CRED=credentials('aws-cred-lk')
        AWS_ID=credentials('LK_AWS_ID')
        AWS_REGION='us-east-1'
        SERVICE_NAME='demo-lk'
    }

    stages {

        stage('Docker Build and Push to ECR') {
            steps {
                echo 'Docker Build...'
                sh 'aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com'
                sh 'docker build --tag ${SERVICE_NAME} .'
                sh 'docker tag ${SERVICE_NAME}:latest ${AWS_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${SERVICE_NAME}:latest'
                echo 'Docker Push...'
                sh 'docker push ${AWS_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${SERVICE_NAME}:latest'
            }
        }

    }
}