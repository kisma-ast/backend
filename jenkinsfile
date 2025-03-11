pipeline {
    agent any

    stages {
        stage('Checkout Backend') {
            steps {
                git branch: 'main', url: 'https://github.com/kisma-ast/backend'
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    sh './build-backend.sh'
                }
            }
        }
    }
}
