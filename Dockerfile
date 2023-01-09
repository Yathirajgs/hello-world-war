FROM maven:3.8.2-openjdk-8 as build_stage
ARG TEST=/sangmesh
WORKDIR ${TEST}
COPY . .
RUN mvn clean package

FROM tomcat:jre8-temurin-focal
ARG TEST=/sangmesh
COPY --from=build_stage ${TEST}/target/hello-world-war-null.war /usr/local/tomcat/webapps/
