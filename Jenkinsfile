pipeline {
    agent {
        node {
            label 'maven'
        }
    }
environment 
{ 
    PATH = "/opt/apache-maven-3.8.8/bin: $PATH "
}
    stages {
        stage('Build-maven') {
            steps {
               sh 'mvn clean package'
            }
        }
    }
}
