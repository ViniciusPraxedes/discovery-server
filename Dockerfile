FROM maven:3.9.6 AS build
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:resolve
COPY . /app
RUN mvn clean
RUN mvn package -DskipTests


FROM eclipse-temurin:17.0.4.1_1-jre
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8010
CMD ["java", "-jar", "app.jar"]