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
    stage('jacoco') {
      steps{
        jacoco()
      }
    }

    stage('SonarQube analysis') {
      steps{
        script {
          def scannerHome = tool 'scanner_sonar';
          withSonarQubeEnv('jenkins-sonar') {
            sh "${scannerHome}/bin/sonar-scanner"
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
