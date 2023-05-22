pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Gitscooby/Guvi.git'
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -t naveen712/Guvi.'
      }
    }

    stage('Login') {
      steps {
        sh 'docker login -u naveennk1467 -p N2veen712'
      }
    }

    stage('Push') {
      steps {
        sh 'docker push naveen712/Guvi'
      }
    }

    stage('Run') {
      steps {
        sh 'docker run -p 8080:8080 naveen712/Guvi'
      }
    }
  }
}
