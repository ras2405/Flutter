### 🎯 Challenge libre – Pantalla de bienvenida responsiva

Construí una pantalla de bienvenida desde cero (`WelcomeScreen`) que combine correctamente elementos visuales distribuidos usando widgets de layout como `Column`, `Row`, `Expanded`, `Spacer`, `Padding` y otros.

---

## 🧱 Requisitos funcionales

1. La pantalla debe contener los siguientes elementos distribuidos verticalmente:
    - Un logo o imagen centrada en la parte superior
    - Un mensaje de bienvenida
    - Un subtítulo o pequeña descripción
    - Dos botones: "Iniciar sesión" y "Registrarse"

2. El diseño debe:
    - Estar alineado correctamente con padding y márgenes consistentes
    - Adaptarse a diferentes tamaños de pantalla (usando `Expanded`, `Flexible` o `Spacer` si es necesario)

3. El botón de "Iniciar sesión" debe imprimir en consola (o Snackbar) el mensaje:
   ```
   Acción: Iniciar sesión
   ```
   y el botón de "Registrarse":
   ```
   Acción: Registrarse
   ```

4. El árbol de widgets debe estar correctamente estructurado y separado por responsabilidades.

---

## 🧪 Cómo probar

Reemplaza el contenido de `main.dart` con el siguiente código para probar tu widget:

```dart
void main() {
  runApp(const MaterialApp(
    home: WelcomeScreen(),
  ));
}
```

---

## 🏆 Criterios de evaluación

- ✅ Layout organizado y legible
- ✅ Uso apropiado de `Row`, `Column`, `Padding`, `Expanded`, etc.
- ✅ Comportamiento visual fluido en pantallas de distintos tamaños
- ✅ Botones funcionales y correctamente posicionados
- ✅ Buenas prácticas de estructura en el árbol de widgets

---

¡Buena suerte! Este desafío evalúa tu capacidad de construir interfaces limpias, flexibles y funcionales aplicando todos los conocimientos de layout aprendidos hasta ahora.
