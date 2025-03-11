#!/bin/bash
set -e  # Arrête l'exécution en cas d'erreur

echo "🚀 Démarrage du build Laravel..."

# Installer les dépendances PHP
echo "📦 Installation des dépendances Composer..."
composer install --no-dev --optimize-autoloader

# Générer les fichiers de configuration et optimiser l'application
echo "⚙️  Optimisation de l'application..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Appliquer les migrations (⚠️ Assure-toi que la base de données est bien connectée)
echo "🛠  Exécution des migrations..."
php artisan migrate --force

echo "✅ Build Laravel terminé avec succès !"
