### 🧠 Fase 3 – Layout & Constraints

---

## 🎯 Objetivo

Aprender a componer interfaces visuales en Flutter usando el sistema de constraints y widgets de layout fundamentales como `Row`, `Column`, `Container`, `Expanded`, entre otros. Esta fase enseña cómo controlar el tamaño, la posición y el flujo visual de widgets, y cómo depurar errores comunes de diseño visual.

---

## 📘 Temas clave

### 1. Modelo de Constraints
- Regla de oro: "Constraints go down, sizes go up, and parents set the position"
- `BoxConstraints`, `tight`, `loose`, `unbounded`

### 2. Widgets de Layout fundamentales
- `Row`, `Column`, `Stack`, `Container`, `Padding`, `Align`, `Center`, `Expanded`, `Flexible`, `SizedBox`, `Spacer`

### 3. Flex Layout
- Uso de `MainAxisAlignment`, `CrossAxisAlignment`
- Distribución de espacio con `Expanded`, `Flexible`, `Spacer`

### 4. Problemas comunes de layout
- Overflow, unbounded height/width, widgets invisibles

### 5. Flutter Inspector & Debug Paint
- Visualizar constraints y padding/margins
- Activar `debug paint`

---

## 📎 Fuentes recomendadas

1. 📘 [Layout Introduction – Flutter Docs](https://docs.flutter.dev/ui/layout)  
   → Descripción general del sistema de diseño, ideal como punto de partida.

2. 📐 [Layout tutorial – Flutter Docs](https://docs.flutter.dev/ui/layout/tutorial)  
   → Tutorial interactivo con ejemplos de `Row`, `Column`, `Container`, etc.

3. 🧩 [Understanding Constraints – Flutter Docs](https://docs.flutter.dev/ui/layout/constraints)  
   → Explica el flujo de constraints y cómo se calcula el tamaño de un widget.

4. 🧾 [Flutter Layout Cheat Sheet – Medium](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)  
   → Tabla visual que resume usos comunes de widgets de layout.

5. 🧰 [Flutter Inspector – DevTools Docs](https://docs.flutter.dev/tools/devtools/inspector)  
   → Cómo usar el Inspector para depurar layout y ver constraints en tiempo real.

---

## ✅ ¿Qué deberías poder hacer luego de esta etapa?

- Construir interfaces robustas con múltiples tipos de layout.
- Controlar tamaño, posición y alineación de widgets hijos.
- Diagnosticar problemas de diseño (overflow, invisible, mal alineado).
- Utilizar el Flutter Inspector para visualizar el layout y los constraints.
- Aplicar `Expanded`, `Flexible`, `Spacer` y `Align` correctamente.

---

## 🧪 Ejercicios prácticos

### 1. 🛠️ Ejercicio guiado: Tarjeta de perfil
Construiremos una tarjeta de perfil con avatar, nombre, descripción y botones usando `Row`, `Column`, `Padding`, `SizedBox`, etc. El objetivo es practicar layout sin errores visuales y con alineación consistente.

Este ejercicio incluirá:
- Código base con `TODOs`
- Comentarios explicativos
- Solución completa en archivo separado

Se puede ver una vista final posible en el archivo `ejercicios/visual_layout_profile_card.png`.
Archivo de comienzo: `ejercicios/layout_profile_card.dart`

### 2. 🎨 Challenge libre: Composición de layout responsiva (Opcional, pero recomendado)
Se te pedirá diseñar una interfaz de tipo "pantalla de bienvenida" con imagen, texto, y botones de acción, respetando principios de layout flexible, alineación y constraints.

El enunciado estará descripto por separado en un archivo Markdown (challenge_libre.md), y no incluirá solución provista.

---

¡Cuando termines esta fase, deberías sentirte cómodo componiendo cualquier layout básico o intermedio en Flutter!
