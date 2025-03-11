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

        stage('Install Composer') {
            steps {
                sh '''
                # Vérifier si Composer est installé
                if ! command -v composer &> /dev/null
                then
                    echo "Installation de Composer..."
                    curl -sS https://getcomposer.org/installer | php
                    mv composer.phar /usr/local/bin/composer
                    chmod +x /usr/local/bin/composer
                fi

                # Vérifier l'installation
                composer --version
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -f "composer.json" ]; then
                    echo "Installation des dépendances PHP..."
                    composer install --no-interaction --prefer-dist --optimize-autoloader
                else
                    echo "composer.json non trouvé, aucune dépendance à installer."
                fi
                '''
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
