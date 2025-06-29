# 🧱 Fase 3 – Etapa 1: Fundamentos de Clean Architecture

Esta etapa está enfocada en introducir los principios fundamentales de la Arquitectura Limpia (Clean
Architecture) y entender cómo organizar un proyecto Flutter de forma modular, desacoplada y
escalable. No se implementa lógica compleja aún, sino que se busca interiorizar los roles de cada
capa y cómo deberían relacionarse.

---

## 🎯 Objetivos

- Comprender qué es Clean Architecture y por qué se utiliza
- Identificar las capas y dependencias en un proyecto bien estructurado
- Aplicar el principio de inversión de dependencias
- Aprender a organizar archivos y carpetas según su responsabilidad

---

## 📚 Fuente obligatoria

📘 [Reso Coder – Clean Architecture Overview (con video)](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)

Se recomienda leer el artículo completo y ver el video al principio. Es suficiente para tener una
base sólida del enfoque.

---

## 🧪 Ejercicio guiado – "Separando responsabilidades"

### 🔧 Instrucciones

En esta actividad vas a trabajar con una funcionalidad simple y ya implementada, cuyo código está
repartido en 4 archivos Dart. El objetivo es entender y aplicar la separación de responsabilidades
propuesta por Clean Architecture.

Nosotros te proveemos los siguientes archivos:

- `mensaje_widget.dart`
- `mensaje_bienvenida.dart`
- `obtener_mensaje.dart`
- `bienvenida_repositorio.dart`

Todos estos archivos se encuentran inicialmente al mismo nivel dentro de `lib/` y la aplicación ya
funciona al ejecutarse si se acopla a un proyecto Flutter.

**Tu tarea consiste en:**

1. **Reorganizar la estructura del proyecto** según Clean Architecture:
    - Crear la estructura de carpetas para las capas: `presentacion`, `aplicacion`, `dominio`,
      `infraestructura`.
    - Ubicar cada archivo en la capa correspondiente.

2. **Restructurar el codigo** como sea necesario para segir la arquitectura clean

3. **Verificar que la aplicación sigue funcionando** sin romper la lógica ya implementada.

Una vez hecho, tu aplicación debe seguir mostrando el mensaje en pantalla:

```
Bienvenido, Juan
```

🗂 La solución con la estructura final recomendada se encuentra en un archivo README separado.

---

Al finalizar esta etapa deberías ser capaz de identificar los límites de cada capa y cómo
organizarlas correctamente en un proyecto Flutter real. 💡