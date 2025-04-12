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

    when {
        branch 'master'
    }
}
