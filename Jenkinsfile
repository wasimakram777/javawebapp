pipeline {
  agent {
      label 'maven' 
  }
	  stage ('Build'){
	    steps{
		sh '''
			mvn clean install
			'''
		}
	  }
	  stage ('Unit Test'){
	    steps{
		  jacoco()
		}
	  }
	  stage('testing'){
	    steps{
		  echo "THis is test job "
		}
		}
      stage('Producton'){
	    steps{
		  echo "This is Prd"
		  } 
		  }
	}
}
