FROM maven:3.8.2-openjdk-8 as mavenbuilder
ARG BUILDVERSION=1.5
WORKDIR /YATHIRAJ
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG BUILDVERSION=1.5
COPY --from=mavenbuilder /YATHIRAJ/target/hello-world-war-${BUIL_DVERSION}.war /usr/local/tomcat/webapps/
