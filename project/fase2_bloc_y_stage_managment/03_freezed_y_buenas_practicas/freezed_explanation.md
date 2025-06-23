# ❄️ Guía práctica: Introducción a Freezed

`freezed` es una herramienta de generación de código que permite definir fácilmente clases
inmutables (para evitar `side effects`), con comparación por valor, métodos como `copyWith`, y
soporte para clases selladas (
sealed classes). Es especialmente útil para construir `states` y `events` en aplicaciones que usan
Bloc o Cubit.

---

## 🧱 Parte 1 – Clases inmutables simples con Freezed

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

//Importante no olvidar el `part` para que freezed pueda generar el código necesario.
//Simpre es 'part '<nombre_archivo>.freezed.dart' con <nombre_archivo> el nombre del archivo donde se define la clase.
//Ejemplo clase User en el archivo user.dart:
part 'user.freezed.dart'; //Archivo generado por freezed que esconde la implementación de los métodos auxiliares.

@freezed // Anotación que indica que esta clase será generada por freezed
abstract class User with _$User {
  const factory User({
    required String name,
    required int age,
  }) = _User;
}
```

> ✅ Al correr `dart run build_runner build`, Freezed generará:
> - El `==` y `hashCode`. (Se utiliza para definir igualdad en un objeto en Dart)
> - El `copyWith()`. (Permite crear una copia del objeto con algunos campos modificados)
> - El constructor y los getters inmutables

---

### ✨ Uso de `copyWith`

```dart

final user = User(name: 'Ana', age: 30);
final updated = user.copyWith(age: 31);
```

---

## 🧱 Parte 2 – Clases selladas (sealed classes) con Freezed

Esto es útil para modelar estados o eventos.

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.success(String token) = Success;

  const factory AuthState.error(String message) = Error;
}
```

> ✅ Al correr `dart run build_runner build`, Freezed generará:
> - Un `sealed class` que permite definir múltiples subclases. Que pueden separadas por tipo en un '
    switch' por ejemplo.
> - Un `copyWith` para cada subclase, permitiendo crear copias modificadas de los estados.

### 🔁 Pattern matching con `switch`

En Dart se permite realizar pattern matching con `switch` para manejar los diferentes estados de
forma clara y concisa.
Cuando Freezed genera la clase por detras utiliza sealed classes, lo que permite hacer un `switch`
sobre los diferentes estados.

```dart
void handle(AuthState state) {
  switch (state) {
    case Initial intialState:
      print('Estado inicial');
      break;
    case Loading loadingState:
      print('Cargando...');
      break;
    case Success successState:
      print('Éxito con token: ${successState.token}');
      break;
    case Error errorState:
      print('Error: ${errorState.message}');
      break;
  }
}
```

---

## ⚙️ Recordá:

Cada vez que modifiques una clase `@freezed`, corré:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Para que tus cambios se reflejen en el código generado.

---

Con estas herramientas, podés definir estructuras limpias, robustas y listas para escalar en tus
proyectos Flutter. ¡A seguir aprendiendo! 🚀
