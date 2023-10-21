pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'  // Set your desired AWS region
        S3_BUCKET_NAME = 'my-terraform-state-bucket'  // Set the name of your Terraform state bucket
    }

    stages {
        stage('SCM Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/pbprasad2329/Terraform-Practice.git']])
            }
        }

        stage("Create S3 Bucket") {
            steps {
                script {
                    def s3BucketExists = sh(
                        script: "aws s3 ls s3://${env.S3_BUCKET_NAME}",
                        returnStatus: true
                    )
                    
                    if (s3BucketExists != 0) {
                        echo "Creating S3 bucket..."
                        sh "aws s3api create-bucket --bucket ${env.S3_BUCKET_NAME} --region ${env.AWS_REGION}"
                    } else {
                        echo "S3 bucket ${env.S3_BUCKET_NAME} already exists."
                    }
                }
            }
        }
        
        stage ("init") {
            steps {
                sh "terraform init -reconfigure -backend-config='bucket=${env.S3_BUCKET_NAME}' -backend-config='key=terraform.tfstate' -backend-config='region=${env.AWS_REGION}'"
            }
        }
        
        stage ("plan") {
            steps {
                sh "terraform plan"
            }
        }

        stage ("apply") {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
    }
}
ion is --> ${branch}"
                sh ("terraform ${branch} --auto-approve")
            }   

        }

    }
}
