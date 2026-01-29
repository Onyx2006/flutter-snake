# 🐍 Flutter Snake Game
Proyecto desarrollado en **Flutter** en equipo, cuyo objetivo es crear el clásico juego **Snake** como aplicación multiplataforma (Android / iOS).
Este proyecto forma parte de un trabajo académico y sirve como introducción práctica al desarrollo de aplicaciones híbridas con Flutter.


## Documentación oficial de Flutter
La documentación completa y oficial de Flutter se puede encontrar aquí:
👉 https://docs.flutter.dev/install/quick?_gl=1%2A17xnirc%2A_ga%2AMTE4MTYyMTQ4LjE3Njk2ODc0MDI.%2A_ga_04YGWK0175%2AczE3Njk2ODc0MDIkbzEkZzAkdDE3Njk2ODc0MDIkajYwJGwwJGgw
A continuación, se incluye un **resumen práctico** de cómo instalar Flutter y crear un proyecto desde Visual Studio Code.


## ⚙️ Instalación de Flutter (resumen rápido)
1. Abrir **Visual Studio Code**
2. Instalar la extensión **Flutter** (incluye Dart)
3. Presionar: `Ctrl + Shift + P`
4. Escribir `Flutter` y seleccionar: Flutter: New Project
5. Visual Studio Code mostrará una opción para **descargar el SDK de Flutter**
    - Seleccionar una carpeta
    - Esperar unos minutos mientras se descarga
6. Cuando lo pida, aceptar **añadir Flutter a las variables de entorno**
7. Una vez finalizado, crear el proyecto Flutter normalmente

Con esto, Flutter quedará correctamente instalado y listo para su uso.


## 📂 Estructura del proyecto Flutter
Nuestro proyecto se organiza de la siguiente forma:

```
flutter_snake/
├── android/ # Código específico para Android
├── ios/ # Código específico para iOS
├── lib/ # Código principal de la aplicación (Dart)
│ ├── main.dart # Punto de entrada de la aplicación
│ ├── screens/ # Pantallas principales de la app
│ ├── widgets/ # Widgets reutilizables (UI)
│ ├── models/ # Modelos de datos (snake, comida, etc.)
├── assets/ # Recursos como imágenes o sonidos
├── test/ # Tests de la aplicación
├── web/ # Para pobrar desde un navegador. Para inicializar flutter run -d chrome
└── pubspec.yaml # Configuración del proyecto y dependencias
```


### Archivos y carpetas importantes
- **main.dart**  
  Archivo principal desde donde arranca la aplicación.

- **lib/screens/**  
  Contiene las pantallas principales, por ejemplo la pantalla del juego.

- **lib/widgets/**  
  Componentes reutilizables como el tablero o el marcador.

- **lib/models/**  
  Clases que representan la lógica del juego (serpiente, comida, posiciones).

- **pubspec.yaml**  
  Archivo donde se configuran dependencias, assets y ajustes del proyecto.


## Descripción del proyecto: Snake
El proyecto consiste en desarrollar el clásico juego **Snake**:
- Una serpiente que se mueve automáticamente por un tablero
- El jugador controla la dirección
- Al comer comida, la serpiente crece
- El juego termina si la serpiente choca con una pared o consigo misma
- Se muestra la puntuación y se permite reiniciar la partida

El objetivo es aplicar conceptos básicos de Flutter como:
- Widgets
- Gestión de estado
- Temporizadores
- Diseño de interfaces
- Trabajo colaborativo con Git y GitHub
