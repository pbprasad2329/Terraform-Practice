pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/pbprasad2329/Terraform-Practice.git']])
            }
        }
        
        stage ("init") {
            steps {
                sh ("terraform init -reconfigure")
            }
            
        }
        
        stage ("plan") {
            steps {
                sh ("terraform plan")
            }
            
        }

        stage ("branch") {
            steps {
                echo "Terraform action is --> ${branch}"
                sh ("terraform ${branch} --auto-approve")
            }   

        }

    }
}
