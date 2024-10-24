pipeline {
    agent none
    stages {
        stage('Checkout Code') {
            agent {
                label 'ec2-agent'
            }
            steps {
                git branch: 'main', url: 'https://github.com/arjun-s-XL/sample-react-app.git'
            }
        }
        
        stage('Install Node.js and React') {
            agent {
                label 'ec2-agent'
            }
            steps {
                script {
                    sh '''
                    # Run the setup script from the repository
                    chmod +x setup-node-react.sh
                    ./setup-node-react.sh
                    '''
                }
            }
        }

        stage('Install App Dependencies') {
            agent {
                label 'ec2-agent'
            }
            steps {
                script {
                    sh '''
                    # Navigate to the project folder
                    cd ${WORKSPACE}
                    # Install project dependencies
                    npm install
                    '''
                }
            }
        }

        stage('Build React Application') {
            agent {
                label 'ec2-agent'
            }
            steps {
                script {
                    sh '''
                    # Build the React application
                    npm run build
                    '''
                }
            }
        }

        stage('Run React Application') {
            agent {
                label 'ec2-agent'
            }
            steps {
                script {
                    sh '''
                    # Run the React application (in background mode)
                    npm start &
                    '''
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}

