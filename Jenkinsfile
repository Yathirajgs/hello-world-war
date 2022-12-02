pipeline {
  agent { node { label 'build' } }
    stages {
      stage ('my build') {
        steps {
         sh 'echo ${BUILD_NUMBER}'
         sh 'mvn package'
         sh 'scp -r target/hello-world-war-1.0.0.war deploy@172.31.18.71:/opt/tomcat/webapps'
        }
      }
    stage ('my deploy') {
     agent { node { label 'deploy' } }
      steps {
       sh 'sh /opt/tomcat/bin/shutdown.sh'
       sh 'sh /opt/tomcat/bin/startup.sh'
      }
    } 
  }
}
