pipeline {
    agent any

    stages {
	    stage('CheckOut') {
            steps {
                echo 'Git Code CheckOut Stage'
		sh 'git clone https://github.com/skattimath/mydemo.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Dcoker Image Building Stage'
		pwd
		//sh 'docker build -t sanjay/tomcat8'
            }
        }
        stage('Test') {
            steps {
                echo 'Code Testing Stage'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Container Deployment Stage'
		sh 'docker-compose up -d'
            }
        }
    }
}
