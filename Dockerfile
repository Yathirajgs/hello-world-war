FROM maven:3.8.2-openjdk-8 as mavenbuilder
COPY . .
RUN mvn clean package

FROM tomcat
COPY --from=mavenbuilder /target/hello-world-war-null.war /usr/local/tomcat/webapps/
