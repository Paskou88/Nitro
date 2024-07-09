FROM openjdk:11
COPY /home/ubuntu/jenkins/workspace/nitro-multibranch_main/target/devops-0.0.1-SNAPSHOT.jar  nitro.jar
ENTRYPOINT [ "JAVA","-jar","nitro.jar" ]