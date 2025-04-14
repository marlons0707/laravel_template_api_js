# Laravel Template API JS
https://github.com/marlons0707/laravel_template_api_js

Plantilla básica para construir APIs Rest con Laravel. Incluye: 
- Autenticación simple y rutas protegidas
- Uso de Laravel Sanctum para autenticación de usuarios
- Implementación de Validators, Resources, Seeders y Factories
- Catálogos de: Usuarios, Unidades de Medida, Categorías y Productos

Sigue los pasos a continuación para configurar y ejecutar el proyecto:

## Requisitos previos

- PHP **>= 8.1** (https://windows.php.net/downloads/releases/)
- MySQL **5.7+**
- Composer **v2.2+**
- Servidor local recomendado: **Laragon**, XAMPP o Docker
- Postman (opcional, para probar las APIs).

## Pasos de instalación

Después de clonar el repositorio, sigue estos pasos para configurar el entorno de desarrollo:

1. **Instalar las dependencias de PHP con Composer:**
    ```bash
    composer install
    ```

2. **Copiar el archivo de entorno:**
    ```bash
    cp .env.example .env
    ```

3. **Generar la clave única de la aplicación:**
    ```bash
    php artisan key:generate
    ```

4. **Configurar el archivo `.env` con la conexión a la base de datos.**

5. **Crear la base de datos (si no existe):**
    - Nombre sugerido: `example_db_js`
    - Codificación recomendada: `utf8mb4_spanish_ci`

6. **Ejecutar las migraciones para crear la estructura de la base de datos:**
    ```bash
    php artisan migrate
    ```

7. **Ejecutar los seeders para llenar las tablas con datos de prueba:**
    ```bash
    php artisan db:seed
    ```

8. **Iniciar el servidor:**
    ```bash
    php artisan serve
    ```

9. **Probar las APIs con Postman:**
    - Importa la colección `laravel_template_api_js.postman_collection.json` en Postman.

## Comandos útiles durante el desarrollo
- **Ejecutar migraciones:**
    ```bash
    php artisan migrate
    ```
- **Ejecutar migraciones con refresh y seed:**
    ```bash
    php artisan migrate:refresh --seed
    ```
- **Limpiar caché de configuración:**
    ```bash
    php artisan config:cache
    ```
- **Limpiar caché de rutas:**
    ```bash
    php artisan route:cache
    ```

## Notas adicionales

- Asegúrate de que el servidor de base de datos esté en ejecución antes de realizar las migraciones.
- Puedes personalizar las configuraciones del archivo `.env` según tus necesidades.

¡Listo! Ahora puedes comenzar a desarrollar tu API con esta plantilla.

## Licencia
Este proyecto está bajo la Licencia MIT. 

## Autor
Marlon Saravia - [LinkedIn](https://www.linkedin.com/in/marlons0707/)


