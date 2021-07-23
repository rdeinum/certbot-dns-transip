pipeline {
  environment {
    registryCredential = 'dockerhub'
    dockerImageRef = "rdeinum/certbot-dns-transip:${env.BUILD_ID}"
  }
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          dockerImage = docker.build(dockerImageRef)
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push('latest')
          }
          sh "docker rmi $dockerImageRef"
        }
      }
    }
  }
}
