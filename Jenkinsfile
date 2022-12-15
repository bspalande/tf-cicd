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
			checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubid', url: 'https://github.com/bspalande/tf-cicd']]])
			}
		}
		stage('Terraform Init') {
			steps {
			sh 'terraform init'
			}
		}
		stage('Terraform Validate'){

                    steps {

                            withCredentials([azureServicePrincipal(
                            credentialsId: 'Jenkins',
                            subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                            clientIdVariable: 'ARM_CLIENT_ID',
                            clientSecretVariable: 'ARM_CLIENT_SECRET',
                            tenantIdVariable: 'ARM_TENANT_ID'
                        ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {

                                sh """

                                terraform validate
                                """
                                   }

                     }
                }

                stage('Terraform Plan'){
                    steps {


                            withCredentials([azureServicePrincipal(
                            credentialsId: 'Jenkins',
                            subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                            clientIdVariable: 'ARM_CLIENT_ID',
                            clientSecretVariable: 'ARM_CLIENT_SECRET',
                            tenantIdVariable: 'ARM_TENANT_ID'
                        ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {

                                sh """

                                echo "Creating Terraform Plan"
                                terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                                """
                                }

                    }
                }

                stage('Waiting for Approval'){
                    steps {
                        timeout(time: 10, unit: 'MINUTES') {
                            input (message: "Deploy the infrastructure?")
                        }
                    }

                }


                stage('Terraform Apply'){
                    steps {

                            withCredentials([azureServicePrincipal(
                            credentialsId: 'Jenkins',
                            subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
                            clientIdVariable: 'ARM_CLIENT_ID',
                            clientSecretVariable: 'ARM_CLIENT_SECRET',
                            tenantIdVariable: 'ARM_TENANT_ID'
                        ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {

                                sh """
                                echo "Applying the plan"
                                terraform apply -auto-approve -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                                """
                                        }

                    }
                }
    }
}