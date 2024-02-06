pipeline{
	agent {label 'slave'}
    stages{
       stage('Git Checkout Stage'){
            steps{
                git branch: 'main', url: 'https://github.com/ChetanaMJyothi/docker-assignment5.git'
            }
         }        
       stage('Build Docker image'){
            steps{
                sh 'docker stop $(docker ps -a -q)'
                sh 'docker build -t 811137303802.dkr.ecr.ap-south-1.amazonaws.com/assignment:9 .'
		sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 811137303802.dkr.ecr.ap-south-1.amazonaws.com'
		sh 'docker push 811137303802.dkr.ecr.ap-south-1.amazonaws.com/assignment:9'
            }
         }
	stage('Deploy Container'){
            steps{
		sh 'docker run -d -p 8082:8080 811137303802.dkr.ecr.ap-south-1.amazonaws.com/assignment:9'
		}
	}
      }
    }
