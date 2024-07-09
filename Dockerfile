FROM openjdk:11
COPY target/devops-0.0.1-SNAPSHOT.jar  nitro.jar
ENTRYPOINT [ "java","-jar","nitro.jar" ]