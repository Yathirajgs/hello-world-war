pipeline {
  agent { node { label 'build' } }
    stages {
      stage ('my build') {
        steps {
         sh 'echo ${BUILD_NUMBER}'
         sh 'mvn deploy'
         sh 'pwd'
        }
      }
    stage ('my deploy') {
      agent { node { label 'deploy' } }
       steps {
        sh 'pwd'
        sh 'whoami'
        sh 'curl -u yathiraj.raj94@gmail.com:Laanl94@ -O "https://yathirajgs.jfrog.io/artifactory/default-libs-release-local/com/efsavage/hello-world-war/1.0.0/hello-world-war-1.0.0.war"'
        sh 'sudo cp -r workspace/build/hello-world-war-${BUILD_NUMBER}.war /opt/tomcat/webapps/'
        sh 'sh /opt/tomcat/bin/shutdown.sh'
        sh 'sh /opt/tomcat/bin/startup.sh'
      }
    } 
  }
}
