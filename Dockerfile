FROM openjdk:19

COPY target/*.jar app.jar
EXPOSE 8010

ENTRYPOINT ["java","-jar","/app.jar"]