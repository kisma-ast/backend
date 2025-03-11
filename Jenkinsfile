pipeline {
    agent any

    stages {
        stage('Checkout Backend') {
            steps {
                script {
                    deleteDir()
                }
                git branch: 'main', url: 'https://github.com/kisma-ast/backend'
            }
        }

        stage('Install Dependencies & Build') {
            steps {
                sh '''
                docker exec backend-php php -v
                docker exec backend-php composer install --no-interaction --prefer-dist --optimize-autoloader
                docker exec backend-php chmod +x build-backend.sh
                docker exec backend-php ./build-backend.sh
                '''
            }
        }
    }
}
