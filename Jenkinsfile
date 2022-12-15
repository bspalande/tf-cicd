pipeline{
    agent any 
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    environment {
        TF_HOME = tool('terraform')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
    
        stage('Terraform Init'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: '0444f5bd-f158-45de-9a56-190ccc7ee8c3',
                    clientIdVariable: 'edef04e2-c2cb-4db9-b50c-245c86f851fb',
                    clientSecretVariable: 'GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang',
                    tenantIdVariable: '069ca8c2-34f8-4786-940a-96d33e8cf1f3'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                                
                        echo "Initialising Terraform"
                        terraform init -backend-config="access_key=$ARM_ACCESS_KEY"
                        """
                           }
                    }
             }
        }

        stage('Terraform Validate'){
            
            steps {
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: '0444f5bd-f158-45de-9a56-190ccc7ee8c3',
                    clientIdVariable: 'edef04e2-c2cb-4db9-b50c-245c86f851fb',
                    clientSecretVariable: 'GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang',
                    tenantIdVariable: '069ca8c2-34f8-4786-940a-96d33e8cf1f3'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                                
                        terraform validate
                        """
                           }
                    }
             }
        }

        stage('Terraform Plan'){
            steps {

                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: '0444f5bd-f158-45de-9a56-190ccc7ee8c3',
                    clientIdVariable: 'edef04e2-c2cb-4db9-b50c-245c86f851fb',
                    clientSecretVariable: 'GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang',
                    tenantIdVariable: '069ca8c2-34f8-4786-940a-96d33e8cf1f3'
                ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
                        
                        sh """
                        
                        echo "Creating Terraform Plan"
                        terraform plan -var "client_id=$ARM_CLIENT_ID" -var "client_secret=$ARM_CLIENT_SECRET" -var "subscription_id=$ARM_SUBSCRIPTION_ID" -var "tenant_id=$ARM_TENANT_ID"
                        """
                        }
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
                    ansiColor('xterm') {
                    withCredentials([azureServicePrincipal(
                    credentialsId: 'Jenkins',
                    subscriptionIdVariable: '0444f5bd-f158-45de-9a56-190ccc7ee8c3',
                    clientIdVariable: 'edef04e2-c2cb-4db9-b50c-245c86f851fb',
                    clientSecretVariable: 'GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang',
                    tenantIdVariable: '069ca8c2-34f8-4786-940a-96d33e8cf1f3'
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
}
