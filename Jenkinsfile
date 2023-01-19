node("java") {
  stage ('checkout-scm'){
    git branch: 'main', credentialsId: 'github-password', url: 'https://github.com/wasimakram777/javawebapp.git'
  }
  stage (' build ') {
   echo "Dev" 
   echo "Build Success" 
 }
  stage ('Test') {
  echo "This is testing"
  }
  stage ('Prod') {
    echo "This is Prod"
  }
  }
