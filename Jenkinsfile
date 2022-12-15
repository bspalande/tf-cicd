pipeline {
    agent any
	tools {
		  terraform 'terraform'
	}
    environment {
        TF_HOME = tool('terraform')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
		stage('checkout') {
		 steps {
			checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubid', url: 'https://github.com/bspalande/tf-cicd']]])
			}
		}
		stage('Terraform Init') {
			steps {
			sh 'terraform init'
			}
		}
    }
}