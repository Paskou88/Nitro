def registry = 'https://paskou.jfrog.io/'
def imageName = 'paskou.jfrog.io/nitro-docker-local/nitro'
def version   = '0.0.1-SNAPSHOT'
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
              echo "----------- build started ----------"
                sh 'mvn clean deploy -Dmaven.test.skip=true'
                 echo "----------- build complted ----------"
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
  
stage("Jar Publish") {
        steps {
            script {
                    echo '<--------------- Jar Publish Started --------------->'
                     def server = Artifactory.newServer url:registry+"/artifactory" ,  credentialsId:"jfrog-cred"
                     def properties = "buildid=${env.BUILD_ID},commitid=${GIT_COMMIT}";
                     def uploadSpec = """{
                          "files": [
                            {
                              "pattern": "jarstaging/com/example/devops/0.0.1-SNAPSHOT/(*)",
                              "target": "nitro-libs-release-local/{1}",
                              "flat": "false",
                              "props" : "${properties}",
                              "exclusions": [ "*.sha1", "*.md5","*.pom"]
                            }
                         ]
                     }"""
                     def buildInfo = server.upload(uploadSpec)
                     buildInfo.env.collect()
                     server.publishBuildInfo(buildInfo)
                     echo '<--------------- Jar Publish Ended --------------->'  
            
            }
        }   
    }
   
    stage(" Docker Build ") {
      steps {
        script {
           echo '<--------------- Docker Build Started --------------->'
           app = docker.build(imageName+":"+version)
           echo '<--------------- Docker Build Ends --------------->'
        }
      }
    }

            stage (" Docker Publish "){
        steps {
            script {
               echo '<--------------- Docker Publish Started --------------->'  
                docker.withRegistry(registry, 'jfrog-cred'){
                    app.push()
                }    
               echo '<--------------- Docker Publish Ended --------------->'  
            }
        }
    }


    }
}
