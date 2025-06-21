### 🎯 Challenge libre – Registro de mascota y bienvenida

Este ejercicio cierra la Fase 1 integrando todo lo aprendido: Dart, widgets con estado, layouts,
navegación y control de flujo.

---

## 🧱 Descripción general

Construí una mini app con **dos pantallas**:

### 🐶 Pantalla 1 – Registro de mascota (`RegistroMascotaScreen`)

Debe contener:

- Un formulario con:
    - Campo de texto para el **nombre** de la mascota
    - Un `DropdownButton` para elegir el **tipo** de mascota: `Perro`, `Gato`, `Otro` (usando un
      `enum`)
    - Campo de texto numérico para la **edad**

- Un botón "Registrar" que:
    - Valide que el nombre no esté vacío y que la edad sea un número válido > 0
    - Si es válido, navegue a la segunda pantalla, enviando una instancia de `Mascota` como
      argumento

### 🎉 Pantalla 2 – Bienvenida

Debe mostrar:

- Un mensaje personalizado:
  ```
  ¡Bienvenido <nombre> el <tipo>!
  ```

- Un ícono distinto para cada tipo de mascota (ej: `Icons.pets`, `Icons.pets_outlined`,
  `Icons.question_mark`)
- La edad, con estilo visual según rango:
    - < 2 años: texto "Joven 🐣"
    - > = 2 años: texto "Adulto 🐾"

- Un botón para "Registrar otra mascota" que:
    - Use `Navigator.pop(context, true)` para volver a la pantalla anterior y reiniciar el flujo

---

## ⚙️ Requisitos técnicos

- Usá `StatefulWidget` donde sea necesario
- Incluí `initState` si inicializás algún valor
- Aplicá control de flujo con `if`, `switch`, o `enum`
- Manejá errores con `SnackBar` si la validación falla
- Usá un layout ordenado y espaciado correctamente (`Padding`, `Column`, `SizedBox`, etc.)
- Usá `Navigator.push` para ir a la segunda pantalla y `pop()` para volver

---

## 📦 Estructura sugerida

```dart
class Mascota {
  final String nombre;
  final TipoMascota tipo;
  final int edad;

  Mascota({required this.nombre, required this.tipo, required this.edad});
}

enum TipoMascota { perro, gato, otro }
```

---

## 🧪 Cómo probar

Reemplaza el contenido de `main.dart` con el siguiente código para probar tu widget:

```dart
void main() {
  runApp(const MaterialApp(home: RegistroMascotaScreen()));
}
```

---

## 🏆 Criterios de evaluación

- ✅ Código limpio y dividido en componentes reutilizables
- ✅ Buen uso de Dart: clases, enum, funciones, null safety
- ✅ Widgets con estado bien implementados
- ✅ Layout organizado y visualmente legible
- ✅ Validaciones efectivas y navegación completa

---

Este desafío integra todos los pilares de la Fase 1. ¡Es tu momento para demostrar dominio de los
conceptos fundamentales de Flutter y Dart! 🐾✨
