pipeline {
  agent {
    label "java"
  }
  stages {
    stage('Build') {
      steps{
        sh 'mvn clean install'
      }
    }
    stage('Test') {
      parallel {
        stage('Test1') {
          steps{
            sh 'echo "test case 1"'
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
    stage('Deploy to Tomcat') {
      steps{
        sh 'echo "Here we deploy the build to tomcat"'
      }
    }
  }
}
