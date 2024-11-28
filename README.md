Proyecto ABM - Gestión de Clientes
Descripción
Este proyecto es una aplicación de ABM (Alta, Baja y Modificación) de clientes, que se conecta a una API externa para consultar información y permite la gestión de los datos de los clientes de manera sencilla.

El sistema también incluye la capacidad de consultar, agregar, modificar y eliminar clientes. Los datos de los clientes se almacenan en formato JSON, y el sistema proporciona un archivo de exportación de clientes que puede ser utilizado para importar y actualizar la base de datos.

Tecnologías Utilizadas
Lenguaje: C#
Framework:  ASP.NET
API externa: Se integra con una API externa para consultar información sobre los clientes.
Datos: El proyecto maneja datos en formato JSON.
Entorno de desarrollo: Visual Studio 

Características

Gestionar clientes: Añadir, modificar y eliminar registros de clientes.

Interfaz sencilla: La aplicación tiene una interfaz simple y fácil de usar para gestionar los clientes.
Instalación

Clonar el repositorio:

Abre una terminal o línea de comandos y ejecuta el siguiente comando:

bash
Copy code
git clone https://github.com/tu_usuario/tu_repositorio.git
Abrir el proyecto en Visual Studio:

Abre el archivo del proyecto .sln con Visual Studio o Visual Studio Code.

Restaurar las dependencias:

Si el proyecto usa dependencias de NuGet, abre la terminal integrada en Visual Studio y ejecuta:

bash
Copy code
dotnet restore
Ejecutar el proyecto:

Después de restaurar las dependencias, puedes ejecutar el proyecto utilizando:

bash
Copy code
dotnet run
O simplemente presionando el botón Iniciar (play) en Visual Studio.

Configuración de archivo JSON:

Asegúrate de que el archivo ExportClientes.json esté presente en la carpeta DAO\Jsons. Si el archivo no está, puedes crear un archivo de ejemplo para simular datos de clientes.


Notas
El archivo ExportClientes.json debe ser accesible desde la ruta configurada en el proyecto.
Asegúrate de que el archivo tenga los datos correctamente estructurados en formato JSON.
Uso
Consultar clientes
Al ejecutar el proyecto, la aplicación hace una solicitud HTTP a la API externa para consultar la lista de clientes.
La respuesta de la API se procesa y los clientes se almacenan en un DataSet.
Gestión de clientes
Puedes gestionar los clientes con las siguientes funcionalidades:

Alta: Agregar un nuevo cliente a la lista.
Baja: Eliminar un cliente de la base de datos.
Modificación: Actualizar la información de un cliente existente.
Exportar clientes
Los datos de los clientes pueden exportarse en formato JSON para poder ser compartidos o importados en otros sistemas.

Estructura del Proyecto
El proyecto tiene la siguiente estructura de carpetas:

bash
Copy code
Proyecto_ABM/
│
├── DAO/                # Capa de acceso a datos
│   ├── Jsons/          # Carpeta que contiene los archivos JSON
│   │   └── ExportClientes.json  # Archivo con los datos de los clientes
│   ├── ApiSigma.cs     # Clase que maneja la integración con la API externa
│
├── Controllers/        # Controladores que gestionan las solicitudes HTTP
│
├── Models/             # Modelos que representan los datos (Cliente, etc.)
│
├── Views/              # Vistas 
│
├── Program.cs          # Configuración y punto de entrada de la aplicación
└── README.md           # Este archivo
