pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh '/opt/apache-maven-3.9.16/bin/mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh '/opt/apache-maven-3.9.16/bin/mvn test'
            }
        }

    }
}