pipeline {
	agent {
	  label 'maven'
	  }
		stages {
		 stage('Build') {
		   steps {
             sh '''
			   mvn clean install
			 '''
			}
		}
		 stage("test"){
		   steps {
		     echo "this isb test"
			}
			}
		stage('Production'){
		steps {
      echo "Deploying in Prod"
		}
 }
 }
}
