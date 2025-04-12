pipeline {
    agent any

    environment {
        MAVEN_HOME = '/usr/share/maven' // Optional: set Maven path if needed
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
                // Replace with your real deploy command/script
                sh './scripts/deploy-staging.sh'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    try {
                        sh './scripts/deploy.sh'
                    } catch (err) {
                        echo "⚠️ Deployment failed: ${err}"
                        // You can mark build as failed or just warn
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
            echo '❌ Pipeline failed! Notifying dev team or rolling back...'
        }
    }
}
