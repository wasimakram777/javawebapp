pipeline {
  agent {
    label "java"
  }
  environment {
    EMAIL_RECIPIENTS = 'pramodprasanna17@gmail.com'
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
          def scannerHome = tool 'sonarqubescanner';
          withSonarQubeEnv('sonarqube') {
            sh """
              ${scannerHome}/bin/sonar-scanner \
              -Dsonar.projectKey=javawebappproject \
              -Dsonar.projectName=javawebappproject \
              -Dsonar.projectVersion=1.0 \
              -Dsonar.java.binaries='target/classes'
            """
          }
        }
      }
    }

    stage("Sonar Quality Gate Check") {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    script {
                        def qualityGate = waitForQualityGate()
                        if (qualityGate.status != 'OK') {
                            error "Pipeline aborted due to quality gate failure: ${qualityGate.status}"
                        }
                    }
                } // End of timeout
            }
    }

    stage('Upload to Nexus') {
      steps{
        nexusArtifactUploader artifacts: [[artifactId: 'SimpleWebApplication', classifier: '', file: 'target/SimpleWebApplication.war', type: 'war']], credentialsId: 'jenkins-nexus', groupId: 'com.maven', nexusUrl: '54.146.128.184:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: '9.1.14'
      }
    }
    
    stage('Deploy to Tomcat') {
      agent {
        label "Tomcat"
      }
      steps{
        sh 'echo "Here we deploy the build to tomcat"'
        deploy adapters: [tomcat10(credentialsId: 'jenkinstomcatmanager', path: '', url: 'http://54.198.34.228:8080/')], contextPath: null, onFailure: false, war: '**/*.war'
      }
    }
  }
}
}
  post {
    failure {
      script {
        mail (to: 'pramodprasanna17@gmail.com',
              subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) failed",
              body: "Please visit ${env.BUILD_URL} for further information"
        )
      }
    }
    success {
      script {
        mail (to: 'pramodprasanna17@gmail.com', 
              subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) succeeded.",
              body: "Please visit ${env.BUILD_URL} for further information."
        )
      }
    }
  }
}

