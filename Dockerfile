FROM php:8.2-apache

# 1. Instalar librerías del sistema y PostgreSQL
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_pgsql

# 2. Habilitar reescritura de URLs
RUN a2enmod rewrite

# 3. Instalar Composer profesionalmente
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Configurar carpeta de trabajo
WORKDIR /var/www/html

# 5. Instalar Laravel forzando la creación (incluso si hay un README)
RUN composer create-project --prefer-dist laravel/laravel . --no-interaction

# 6. Apuntar el servidor a la carpeta pública
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# 7. Permisos de escritura para Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
