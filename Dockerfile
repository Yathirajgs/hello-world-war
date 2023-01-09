FROM maven:3.8.2-openjdk-8 as build_stage
ARG TEST=/wali
WORKDIR ${TEST}
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG TEST=/wali
COPY --from=build_stage ${TEST}/target/hello-world-war-null.war /usr/local/tomcat/webapps/
