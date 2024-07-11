FROM openjdk:17-jdk-slim
COPY jarstaging/com/example/devops/0.0.1-snapshot/devops-0.0.1-snapshot.jar   nitro.jar
ENTRYPOINT [ "java","-jar","nitro.jar" ]
