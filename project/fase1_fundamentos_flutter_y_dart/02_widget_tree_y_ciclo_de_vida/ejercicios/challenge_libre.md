### 🎯 Challenge libre – MoodChangerWidget

Construí desde cero un widget llamado `MoodChangerWidget` que demuestre tu dominio del árbol de
widgets, widgets con estado, ciclo de vida, uso del `BuildContext`, visibilidad condicional y
control de flujo.

---

## 🧱 Requisitos funcionales

1. El widget debe recibir como parámetro:
   ```dart
   final String username;
   ```

2. En `initState()` imprimí en consola:
   ```
   initState: Bienvenido <username>
   ```

3. En `dispose()` imprimí:
   ```
   dispose: Hasta luego <username>
   ```

4. Definí una lista fija de estados de ánimo:
   ```dart
   ['Feliz', 'Triste', 'Enojado']
   ```
   y usá un `DropdownButton` para que el usuario pueda seleccionar uno.

5. Según el estado de ánimo seleccionado, se debe:
    - Mostrar un ícono o emoji representativo
    - Cambiar el color de fondo o del texto (usando `Theme.of(context)` o condicionales de estilo)
    - Mostrar un mensaje reactivo como `"Hoy estás: Feliz ☀️"`

6. Al seleccionar un estado de ánimo, mostrarse un `SnackBar` que diga:
   ```
   Estado de ánimo cambiado a: <estado>
   ```

7. Si el estado es "Triste":
    - Mostrar un botón con el texto “Necesito un abrazo ❤️”
    - Al presionar, mostrar otro `SnackBar` o imprimir en consola:
      ```
      ¡Abrazo enviado!
      ```

---

## 🏗️ Estructura sugerida

```dart
class MoodChangerWidget extends StatefulWidget {
  final String username;

  const MoodChangerWidget({super.key, required this.username});

  @override
  State<MoodChangerWidget> createState() => _MoodChangerWidgetState();
}
```

Tu `State` debe manejar:

- `String _selectedMood = 'Feliz';`
- Uso de `setState()` para actualizar la UI
- Control de flujo para personalizar comportamiento

---

## 🧪 Cómo probar

Reemplaza el contenido de `main.dart` con el siguiente código para probar tu widget:

```dart
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: MoodChangerWidget(username: 'Juan'),
      ),
    ),
  ));
```

---

## 🏆 Criterios de evaluación

- ✅ Uso correcto de `initState`, `dispose`
- ✅ Manejo de `BuildContext` (para Theme y SnackBar)
- ✅ Control de estado y renderizado dinámico
- ✅ Lógica de flujo clara y reactiva
- ✅ Interacción intuitiva y legible

---

¡Buena suerte! Este desafío es tu oportunidad para construir un componente único, empático y
funcional usando todo lo aprendido en esta etapa.
