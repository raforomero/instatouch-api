FROM php:8.2-apache

# 1. Instalar librerías y PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev unzip git && docker-php-ext-install pdo pdo_pgsql

# 2. Configurar Apache
RUN a2enmod rewrite
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# 3. Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Preparar la carpeta
WORKDIR /var/www/html

# 5. COPIAR tus archivos de GitHub al contenedor ANTES de instalar
COPY . .

# 6. Instalar Laravel (sin borrar tus archivos)
RUN composer install --no-interaction --optimize-autoloader || composer create-project --prefer-dist laravel/laravel . --no-interaction

# 7. Permisos finales
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
