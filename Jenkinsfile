pipeline {
  agent {
    label "java"
  }
  stages {
    stage('checkout-scm') {
      steps{
        git branch: 'main', credentialsId: 'jenkins-github', url: 'https://github.com/wasimakram777/javawebapp.git'
      }}
    stage('Build') {
      steps{
        sh 'mvn clean install'
      }
    }
    stage('Test') {
      parallel {
        stage('Test1') {
          steps{
            sh 'echo "test case 1.2"'
          }
        }
        stage('Test2'){
          steps{
            sh 'echo "test case 2 "'
          }
        }
      }
    }
    stage('Deploy') {
      steps{
        sh 'echo "Here we deploy the build"'
      }
    }
    stage('Notify') {
      steps{
        sh 'echo "Here we notify the team"'
      }
    }
  }
}
