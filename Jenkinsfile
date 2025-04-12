pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the app...'
                // Add build commands here, like: sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test commands here, like: sh 'mvn test'
            }
        }

        stage('Deploy to Staging') {
            steps {
                echo 'Deploying to staging...'
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying to production...'
            }
        }
    }

    post {
        failure {
            echo 'The pipeline failed. Sending notifications...'
        }
    }
}
