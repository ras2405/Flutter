### 🧭 Fase 4 – Navegación

---

## 🎯 Objetivo

Comprender el sistema de navegación de Flutter usando el enfoque imperativo clásico. Los trainees
aprenderán a moverse entre pantallas, pasar y devolver datos, declarar rutas con nombre y evitar
errores comunes relacionados al `BuildContext`.

---

## 📘 Temas clave

### 1. Navegación imperativa

- `Navigator.push`, `Navigator.pop`
- Uso de `MaterialPageRoute`

### 2. Rutas con nombre

- Declaración de rutas en `MaterialApp.routes`
- (Opcional) uso de `onGenerateRoute`

### 3. Paso de parámetros y retorno de datos

- Enviar datos a una nueva pantalla por constructor
- Recibir datos con `pop(context, resultado)`

### 4. Context y navegación

- Importancia del `BuildContext` correcto
- Precauciones al usar `context` después de operaciones asíncronas

---

## 📎 Fuentes recomendadas

1. 📘 [Navigation and routing – Flutter Docs](https://docs.flutter.dev/ui/navigation)  
   → Introducción completa al sistema de navegación de Flutter.

2. 📚 [Cookbook: Navigate to a new screen and back](https://docs.flutter.dev/cookbook/navigation/navigation-basics)  
→ Ejemplo práctico de cómo navegar entre pantallas y volver atrás.

3. 📦 [Send data to a new screen](https://docs.flutter.dev/cookbook/navigation/passing-data)  
   → Demuestra cómo pasar datos de una pantalla a otra a través del constructor.

4. 🔁 [Return data from a screen](https://docs.flutter.dev/cookbook/navigation/returning-data)  
   → Enseña cómo retornar datos desde una pantalla secundaria usando `pop()`.

---

## ✅ ¿Qué deberías poder hacer luego de esta etapa?

- Navegar entre pantallas usando `Navigator.push` y `Navigator.pop`
- Declarar rutas con nombre y navegar entre ellas
- Pasar y retornar datos entre pantallas
- Usar correctamente el `BuildContext` dentro del árbol de widgets
- Identificar cuándo se puede producir un error por mal uso del `context`

---

## 🧪 Ejercicio práctico

### 🛠️ Ejercicio guiado: Selector de frutas

Implementar una pantalla con una lista de frutas. Al seleccionar una, se navega a una pantalla de
detalle donde se puede confirmar o cancelar la selección. El resultado se muestra al volver a la
pantalla anterior. Incluirá código base con `TODOs` y solución aparte.

El ejercicio se puede encontrar en el archivo `ejercicios/fruit_selector_nav.dart`.
La solución de referencia está en `ejercicios/solution/fruit_selector_nav_solution.dart`.

---

¡Con esta etapa finalizás la base esencial para construir interfaces Flutter conectadas entre sí!
