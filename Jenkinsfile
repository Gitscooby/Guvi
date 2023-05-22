pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Building a docker image') {
      steps {
        sh 'docker build -t naveen712/jenkins-docker-hub .'
      }
    }
    stage('Login to dockerhub') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Pushing image to dockerhub') {
      steps {
        sh 'docker push naveen712/jenkins-docker-hub'
      }
    }
    stage('Run') {
      steps {
        sh 'docker run -itd -p 80:80 naveen712/jenkins-docker-hub'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
