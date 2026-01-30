FROM php:8.2-apache

# 1. Dependencias
RUN apt-get update && apt-get install -y libpq-dev unzip git && docker-php-ext-install pdo pdo_pgsql
RUN a2enmod rewrite
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# 2. Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html

# 3. Instalar Laravel
RUN composer create-project --prefer-dist laravel/laravel . --no-interaction

# 4. SOBREESCRIBIR con tus archivos de GitHub (Aquí es donde entra tu web.php y visor.blade.php)
COPY . .

# 5. Permisos
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
