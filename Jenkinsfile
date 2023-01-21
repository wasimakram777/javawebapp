pipeline {
  agent {
    label "java"
  }
  stages {
    stage('checkout-scm') {
      steps{
        git branch: 'main', credentialsId: 'github-password', url: 'https://github.com/wasimakram777/javawebapp.git'
      }}
    stage(maven) {
      steps{
        sh 'mvn clean install'
      }
    }
  }
}
