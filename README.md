# NomadaApp

Una aplicación Flutter que demuestra las mejores prácticas de desarrollo móvil utilizando arquitectura limpia y patrones modernos.

## 🏗️ Arquitectura

Este proyecto implementa **Clean Architecture** para mantener una separación clara de responsabilidades y facilitar el mantenimiento y testing del código.

### Estructura del Proyecto

```
lib/
├── core/                  
│   ├── constants/         
│   ├── models/             
│   ├── router/            
│   ├── services/           
│   ├── theme/              
│   ├── utils/              
│   └── widgets/            
└── features/               
    ├── home/
    ├── profile/
    ├── register/
    └── address/
```

## 🎯 Características Principales

### Clean Architecture
- **Separación por capas**: Domain, Infrastructure, y Presentation
- **Inversión de dependencias**: Las capas internas no conocen las externas
- **Testabilidad**: Cada capa puede ser probada de forma independiente

### MVP (Model-View-Presenter)
- **Separación de lógica**: La lógica de negocio está separada de la UI
- **Testabilidad mejorada**: Los presenters pueden ser probados sin UI
- **Mantenibilidad**: Cambios en la UI no afectan la lógica de negocio

### Empaquetado por Features
- **Organización modular**: Cada feature contiene toda su funcionalidad
- **Escalabilidad**: Fácil agregar nuevas funcionalidades
- **Mantenimiento**: Código relacionado agrupado en un solo lugar

### Gestión de Estado con Riverpod
- **Reactive programming**: Estado reactivo y eficiente
- **Inyección de dependencias**: DI integrada y type-safe

### Inyección de Dependencias
- **Desacoplamiento**: Componentes independientes y reutilizables
- **Testing**: Fácil intercambio de implementaciones para tests
- **Configuración centralizada**: Todas las dependencias en un lugar

### Freezed para Modelos Inmutables
- **Inmutabilidad**: Modelos de datos seguros y predecibles
- **Code generation**: Menos boilerplate code
- **Pattern matching**: Manejo elegante de estados


## 📱 Funcionalidades

- **Home**: Pantalla principal de la aplicación
- **Profile**: Gestión de perfil de usuario
- **Register**: Registro de nuevos usuarios
- **Address**: Gestión de direcciones

## 🚀 Configuración Local

Este proyecto está configurado para funcionar completamente en local, demostrando las mejores prácticas de desarrollo sin dependencias externas complejas.

### Requisitos
- Flutter SDK ^3.9.0
- Dart SDK

### Instalación
```bash
flutter pub get
flutter pub run build_runner build
```

### Ejecutar la aplicación
```bash
flutter run
```

### Ejecutar tests
```bash
flutter test
```