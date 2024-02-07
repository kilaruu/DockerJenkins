pipeline{
	agent {label 'Docker'}
    stages{
       stage('Git Checkout Stage'){
            steps{
                git branch: 'main', url: 'https://github.com/kilaruu/DockerJenkins.git'
            }
         }        
       stage('Build Docker image'){
            steps{
                sh 'docker build -t 070682943625.dkr.ecr.ap-south-1.amazonaws.com/javaapp:new .'
		sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 070682943625.dkr.ecr.ap-south-1.amazonaws.com'
		sh 'docker push 070682943625.dkr.ecr.ap-south-1.amazonaws.com/javaapp:new'
            }
         }
	stage('Deploy Container'){
            steps{
		sh 'docker run -d -p 8090:8080 070682943625.dkr.ecr.ap-south-1.amazonaws.com/javaapp:new'
		}
	}
      }
    }
