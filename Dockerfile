FROM openjdk:8
EXPOSE 8318
ADD ./petclinic.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]