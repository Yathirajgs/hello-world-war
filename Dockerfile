FROM maven:3.8.2-openjdk-8 as mavenbuilder
WORKDIR /wali
COPY . .
RUN mvn clean package

FROM tomcat:jre8-temurin-focal
COPY --from=mavenbuilder /wali/target/hello-world-war-null.war /usr/local/tomcat/webapps/
