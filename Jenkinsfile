pipeline {
  agent { node { label 'build' } }
    stages {
      stage ('my build') {
        steps {
         sh 'docker build -t tomcatimage:${BUILD_VERSION} .'
        }
      }
      stage (publish) {
        steps {
            sh 'docker login -u gsyathiraj -p Yathiraj94@'
            sh 'docker tag tomcatimage gsyathiraj/tomcatproject:${BUILD_VERSION}'
            sh 'docker push gsyathiraj/tomcatproject:${BUILD_VERSION}'
        }
      } 
    stage ('my deploy') {
      agent { node { label 'deploy' } }
       steps {
        sh 'docker pull gsyathiraj/tomcatproject'
        sh 'docker rm -f tomcatproject' 
         sh 'docker run -d -p 8080:8080 -name tomactproject gsyathiraj/tomcatimage:${BUILD_VERSION}'
      }
    } 
  }
}
