# ❄️ Freezed aplicado a Bloc

Este documento muestra cómo integrar `freezed` en la estructura de Bloc, comparando un Bloc clásico con uno modernizado usando `freezed` para definir eventos y estados.

---

## 🧱 Ejemplo clásico sin `freezed`

### 📦 Eventos
```dart
abstract class CounterEvent {}

class IncrementPressed extends CounterEvent {}
class DecrementPressed extends CounterEvent {}
```

### 🔁 Estados
```dart
class CounterState {
  final int counter;
  const CounterState(this.counter);
}
```

### 🧠 Bloc
```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementPressed>((event, emit) => emit(CounterState(state.counter + 1)));
    on<DecrementPressed>((event, emit) => emit(CounterState(state.counter - 1)));
  }
}
```

---

## ✅ Versión moderna con `freezed`

### 📦 Eventos con `freezed`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter_event.freezed.dart';

@freezed
sealed class CounterEvent with _$CounterEvent {
  const factory CounterEvent.incrementPressed() = IncrementPressed;
  const factory CounterEvent.decrementPressed() = DecrementPressed;
}
```

### 🔁 Estados con `freezed`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter_state.freezed.dart';

@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({required int counter}) = _CounterState;
}
```

### 🧠 Bloc con `switch`
```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case IncrementPressed():
          emit(state.copyWith(counter: state.counter + 1));
        case DecrementPressed():
          emit(state.copyWith(counter: state.counter - 1));
      }
    });
  }
}
```

---

## 🚀 Ventajas de usar `freezed`
- Menos código repetitivo
- Estados inmutables y seguros por default
- Soporte para `switch` → más legible y mantenible
- Comparación por valor (`==`, `hashCode`)
- Autocompletado y validación más precisa en el IDE

---

## 🛠️ Recordatorio
Después de definir o modificar tus clases con `freezed`, corré:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

Con esta integración, tus Blocs serán más expresivos, seguros y escalables. 🎯
