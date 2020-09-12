FROM openjdk:11.0.8-jre-slim
COPY microservice.jar /usr/app/microservice.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/microservice.jar"] 
