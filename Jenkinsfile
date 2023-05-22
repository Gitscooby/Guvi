pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/Gitscooby/Guvi.git']]])
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def imageName = "naveen712/Guvi:${env.BUILD_NUMBER}"
                    def dockerImage = docker.build(imageName, "-f Dockerfile .")
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials-id') {
                        def imageName = "your-dockerhub-username/your-image-name:${env.BUILD_NUMBER}"
                        docker.image(imageName).run('-p 8080:80 --name your-container-name')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline execution failed!'
        }
    }
}
