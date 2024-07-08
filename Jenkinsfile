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
        
stage('SonarQube analysis') {
    environment 
{ 
    scannerHome = tool 'nitro-sonar-scanner'
}
    steps {
              withSonarQubeEnv('nitro-sonarqube-server') { 
      sh "${scannerHome}/bin/sonar-scanner"
    } 
            }
    
  }
    }
}
