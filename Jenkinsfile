pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven'
    }

    stages {
        stage('Build') {
            steps {
                echo '🔨 Building the Java project with Maven...'
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo '✅ Running unit tests...'
                sh 'mvn test'
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo '🚀 Deploying to Staging environment...'
                bat './deploy-staging.bat'
            }
        }

        stage('Deploy to Production') {
             when {
            branch 'master'
        }
            steps {
                script {
                    try {
                        bat './scripts/deploy-prod.bat'
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
