pipeline {
    agent any

    stages {
        stage('Checkout Backend') {
            steps {
                script {
                    deleteDir() // Nettoyage
                }
                git branch: 'main', url: 'https://github.com/kisma-ast/backend'
            }
        }

        stage('Verify Backend Directory') {
            steps {
                script {
                    if (!fileExists('build-backend.sh')) {
                        error "Le fichier 'build-backend.sh' est introuvable !"
                    }
                }
            }
        }

        stage('Install PHP & Composer') {
            steps {
                sh '''
                # Installer PHP si non présent
                if ! command -v php &> /dev/null; then
                    echo "Installation de PHP..."
                    apt update && apt install -y php-cli unzip curl
                fi

                # Installer Composer si non présent
                if ! command -v composer &> /dev/null; then
                    echo "Installation de Composer..."
                    curl -sS https://getcomposer.org/installer | php
                    mv composer.phar /usr/local/bin/composer
                    chmod +x /usr/local/bin/composer
                fi

                # Vérification
                php -v
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
                    echo "composer.json non trouvé."
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
