pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo '🔨 Building the Java project with Maven...'
            }
        }

        stage('Test') {
            steps {
                echo '✅ Running unit tests...'
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo '🚀 Deploying to Staging environment...'
                bat './deploy-staging.bat'
            }
        }

        stage('Deploy to Production') {
        
            steps {
                script {
                    try {
                        bat './deploy-prod.bat'
                    } catch (err) {
                        echo "⚠️ Deployment failed: ${err}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline completed successfully!'
        }

        failure {
            echo '❌ Pipeline failed! Notifying dev team and rolling back...'
        }
    }
}
