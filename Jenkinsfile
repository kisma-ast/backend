pipeline {
    agent any

    stages {
        stage('Checkout Backend') {
            steps {
                script {
                    // Nettoyer l'espace de travail pour éviter les conflits
                    deleteDir()
                }
                git branch: 'main', url: 'https://github.com/kisma-ast/backend'
            }
        }

        stage('Verify Backend Directory') {
            steps {
                script {
                    if (!fileExists('build-backend.sh')) {
                        error "Le fichier 'build-backend.sh' est introuvable ! Vérifiez qu'il est bien dans le dépôt."
                    }
                }
            }
        }

        stage('Set Permissions') {
            steps {
                sh 'chmod +x build-backend.sh'
            }
        }

        stage('Build Backend') {
            steps {
                sh './build-backend.sh'
            }
        }
    }
}
