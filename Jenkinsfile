pipeline {
  agent {
    label "java"
  }
  stages {
    stage('checkout-scm') {
      steps{
        git branch: 'main', credentialsId: 'jenkins-github', url: 'https://github.com/wasimakram777/javawebapp.git'
      }}
    stage(Build) {
      steps{
        sh 'mvn clean install'
      }
    }
    stage(Test) {
      steps{
        sh 'echo "This is testing the Build"'
      }
    }
    stage(Deploy) {
      steps{
        sh 'echo "Here we deploy the build"'
      }
    }
  }
}
