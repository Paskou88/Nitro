FROM openjdk:11
COPY jarstaging/com/example/devops/0.0.1-SNAPSHOT/devops-0.0.1-20240709.124645-1.jar  nitro.jar
ENTRYPOINT [ "java","-jar","nitro.jar" ]
