# 🧩 Guía avanzada sobre Inyección de Dependencias con `injectable` y `GetIt`

En **BaqueanoApp** utilizamos `GetIt` junto al paquete `injectable` para manejar la inyección de dependencias de forma clara, desacoplada y escalable. Esta guía explicará:

- Qué problema resuelve la inyección de dependencias.
- Ventajas de usar `injectable` en relación a principios SOLID.
- Cómo evoluciona tu código al usar inyección de dependencias manual vs. automática (`injectable`).

---

## 🚧 ¿Qué es la Inyección de Dependencias?

La inyección de dependencias es un patrón que permite desacoplar componentes del sistema, evitando que dependan directamente de implementaciones concretas.

### Sin inyección (acoplamiento fuerte):

```dart
class AnimalCubit {
  final AnimalRepository repo = AnimalRepositoryImpl();
}
```

👉 Problema: Dependencia rígida a una implementación concreta (`AnimalRepositoryImpl`).

### Con inyección (acoplamiento débil, SOLID compliant):

```dart
class AnimalCubit {
  AnimalCubit(this.repo);
  final AnimalRepository repo;
}
```

👉 Ventaja: Fácil cambiar implementaciones, facilita test unitarios y reduce acoplamiento.

---

## 🔧 Inyección Manual en Flutter (sin paquetes)

Sin herramientas adicionales, tendrías que pasar explícitamente las dependencias:

```dart
void main() {
  final repo = AnimalRepositoryImpl();
  final cubit = AnimalCubit(repo);
  runApp(MyApp(cubit));
}

class MyApp extends StatelessWidget {
  MyApp(this.cubit);
  final AnimalCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(cubit));
  }
}
```

👉 Problema: Muchos parámetros y dificultad en pasar dependencias por toda la aplicación.

---

## 🚀 Usando `GetIt` (Service Locator manual)

`GetIt` resuelve el problema de acceder a dependencias desde cualquier punto:

```dart
final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AnimalRepository>(AnimalRepositoryImpl());
  getIt.registerFactory(() => AnimalCubit(getIt<AnimalRepository>()));

  runApp(MyApp());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AnimalCubit>();
    return Scaffold();
  }
}
```

👉 Mejora: Acceso global y flexible a instancias sin parámetros adicionales.

---

## 🧙 `injectable`: Automatizando `GetIt`

`injectable` simplifica aún más la gestión automática del Service Locator:

### Instalación:
```bash
flutter pub add get_it
flutter pub add injectable
flutter pub add build_runner --dev
flutter pub add injectable_generator --dev
```

### Generación automática:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🏷️ Anotaciones principales

### ✅ `@injectable`
Crea una nueva instancia cada vez que se necesita:

```dart
@injectable
class AnimalService {
  AnimalService(this.repo);
  final AnimalRepository repo;
}
```

### ✅ `@singleton`
Una única instancia global, creada al iniciar:

```dart
@singleton
class ApiClient {}
```

### ✅ `@lazySingleton`
Una única instancia creada la primera vez que se usa:

```dart
@lazySingleton
class Logger {}
```

---

## 📦 Antes y después con `injectable`

### Sin `injectable`:
```dart
final getIt = GetIt.instance;
getIt.registerLazySingleton<AnimalRepository>(() => AnimalRepositoryImpl());
getIt.registerFactory(() => AnimalCubit(getIt<AnimalRepository>()));
```

### Con `injectable`:

```dart
@LazySingleton(as: AnimalRepository)
class AnimalRepositoryImpl implements AnimalRepository {}

@injectable
class AnimalCubit {
  AnimalCubit(this.repo);
  final AnimalRepository repo;
}
```

Automáticamente genera:

```dart
Future<void> main() async {
  await configureDependencies();
  runApp(MyApp());
}
```

👉 **Resultado**: Menos código, menos errores, escalable y fácil de mantener.

---

## 🧱 Aplicación en BaqueanoApp (Clean Architecture)

Usamos `injectable` para cumplir los principios SOLID y Clean Architecture:

- Interfaces (`domain/repositories`) definen contratos.
- Implementaciones concretas (`infrastructure`) usan anotaciones `@LazySingleton`.
- Cubits/Blocs (`application`) reciben dependencias ya resueltas con `@injectable`.

### Ejemplo práctico:

```dart
// domain/repositories/animal_repository.dart
abstract class AnimalRepository {
  List<String> getAnimales();
}

// infrastructure/repositories/animal_repository_impl.dart
@LazySingleton(as: AnimalRepository)
class AnimalRepositoryImpl implements AnimalRepository {
  @override
  List<String> getAnimales() => ['Perro', 'Gato'];
}

// application/cubit/animal_cubit.dart
@injectable
class AnimalCubit extends Cubit<List<String>> {
  AnimalCubit(this._repo) : super([]);

  final AnimalRepository _repo;

  void cargarAnimales() {
    emit(_repo.getAnimales());
  }
}
```

Uso desde cualquier widget:
```dart

final cubit = getIt<AnimalCubit>();
```

---

## 📚 Fuentes oficiales

- [Documentación de `get_it`](https://pub.dev/packages/get_it)
- [Documentación de `injectable`](https://pub.dev/packages/injectable)

---

🚀 **Conclusión:** Usar `injectable` junto a `GetIt` simplifica notablemente la gestión de dependencias, facilitando un código más limpio, escalable, mantenible y alineado a buenas prácticas (SOLID y Clean Code).
