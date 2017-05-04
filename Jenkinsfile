node ('testslave') {
  stage('clone'){
    checkout scm
  }
  stage('docker build the dist folder') {
    sh './Jenkinsfile.sh'
    }
  }
