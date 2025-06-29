# 🔄 Fase 2 – Etapa 1: Fundamentos de Bloc y Cubit (puro Dart)

Esta etapa tiene como objetivo ayudarte a comprender **cómo funciona Bloc y Cubit a nivel lógico**,
sin depender todavía del framework Flutter. Vas a trabajar exclusivamente en Dart para enfocar toda
tu atención en los conceptos fundamentales del patrón Bloc.

---

## 🎯 Objetivo

- Comprender qué son Bloc y Cubit
- Saber cómo reaccionan y emiten nuevos estados
- Observar cómo funcionan internamente usando `streams`
- Entender cuándo usar uno u otro

---

## 📘 Lectura recomendada

👉 [Bloc Concepts – Bloc Library](https://bloclibrary.dev/bloc-concepts/)

En esta lectura se explican los conceptos base:

- `Cubit<State>`: manejo de un estado con métodos directos y `emit()`
- `Bloc<Event, State>`: entrada y salida por separado usando `add()` y `on<Event>()`
- `state`: el valor actual
- `stream`: cómo reaccionar a los cambios desde afuera

---

## 🛠️ Ejercicio guiado – Simulador de temperatura

### 🧪 Objetivo del ejercicio:

Construir una simulación en consola que modele una estación de temperatura usando Cubit y Bloc.

### 🔧 Instrucciones:

1. Crear un `TemperatureCubit`:
    - Estado: número decimal (`double`) que representa la temperatura
    - Métodos: `increase()` y `decrease()` que modifican la temperatura y emiten un nuevo estado
    - Escuchar los cambios con `cubit.stream.listen(...)`

2. Crear un `TemperatureBloc`:
    - Eventos: `IncreaseTemp`, `DecreaseTemp`
    - Estado: igual al cubit (número decimal)
    - Manejar los eventos con `on<Event>()`
    - Agregar eventos con `bloc.add(...)`
    - Escuchar con `bloc.stream.listen(...)`

3. Comparar ambos enfoques:
    - ¿Cuál es más simple?
    - ¿Cuál es más flexible?
    - ¿Cuál usarías en cada caso?

---

## ▶️ Recordatorio

Este ejercicio se corre en consola, sin usar Flutter:

```bash
dart run ubicacion/del/archivo/temperature_bloc_cubit.dart
```

---

¡Mucha suerte! 💻
