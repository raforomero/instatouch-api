FROM php:8.2-apache

# 1. Instalar librerías para PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

# 2. Habilitar reescritura de URLs para Laravel
RUN a2enmod rewrite

# 3. Instalar Composer (el instalador de Laravel)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Configurar carpeta de trabajo
WORKDIR /var/www/html

# 5. Instalar un proyecto Laravel limpio aquí mismo
RUN composer create-project laravel/laravel . --quiet

# 6. Apuntar el servidor a la carpeta pública de Laravel
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# 7. Dar permisos de escritura
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
