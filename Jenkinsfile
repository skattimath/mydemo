pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Dcoker Image Building Stage'
		sh 'pwd'
		sh 'docker build -t sanjay/tomcat8 .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Container Deployment Stage'
		sh '/usr/local/bin/docker-compose up -d'
            }
        }
    }
}
