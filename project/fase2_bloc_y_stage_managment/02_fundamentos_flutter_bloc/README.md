# 🍌 Fase 2 – Etapa 2: Bloc integrado con Flutter

En esta etapa aprenderás a conectar `Bloc` con la UI de Flutter. El objetivo es que puedas crear
pantallas reactivas que respondan automáticamente a los cambios de estado, siguiendo buenas
prácticas de separación de lógica y presentación.

---

## 🎯 Objetivos

- Integrar `Bloc` o `Cubit` en una app Flutter real
- Utilizar `BlocProvider` para inyectar la lógica
- Mostrar datos en la UI usando `BlocBuilder`
- Ejecutar efectos secundarios con `BlocListener`
- Aplicar buenas prácticas: separación de responsabilidades y reactualización eficiente

---

## 📚 Lectura recomendada

1. 📘 [Flutter Bloc Core Concepts](https://bloclibrary.dev/flutter-bloc-concepts/)
    - Explicación de los conceptos clave de Bloc y cómo se integran con Flutter
    - Enfoque en:
        - 📘[BlocProvider](https://bloclibrary.dev/flutter-bloc-concepts/#blocprovider)
        - 📘[BlocBuilder](https://bloclibrary.dev/flutter-bloc-concepts/#blocbuilder)
        - 📘[BlocListener](https://bloclibrary.dev/flutter-bloc-concepts/#bloclistener)
        - 📘[BlocConsumer](https://bloclibrary.dev/flutter-bloc-concepts/#blocconsumer)
---

## 🛠️ Ejercicio guiado – Selector de frutas

### 🧪 Descripción

Construí una app con las siguientes características:

- Mostrá una fila horizontal con botones para elegir una fruta (`Manzana`, `Banana`, `Naranja`)
- Al seleccionar una fruta:
    - Se actualiza el estado actual en el Bloc
    - Se muestra el nombre de la fruta seleccionada en la pantalla
    - Se lanza un `SnackBar` con el texto "Seleccionaste: <fruta>"

### 🧰 Técnicamente:

- Bloc con un solo evento: `SelectFruit(String fruta)`
- Estado: `SelectedFruitState` que contiene la fruta actual
- `BlocBuilder`: reconstruye el texto
- `BlocListener`: lanza el `SnackBar`

---

## ✅ Buenas prácticas a observar

- Separación clara entre UI y lógica de estado
- Evitar lógica en los widgets
- Usar `BlocBuilder` solo para cambios visibles
- Efectos secundarios (SnackBars, navegación, logs) en `BlocListener`

---

¡Con este ejercicio consolidás el uso de Bloc con UI en Flutter! 🍎🍌🍊
