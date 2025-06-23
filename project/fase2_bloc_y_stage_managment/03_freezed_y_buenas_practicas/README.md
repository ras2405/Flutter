# 🧩 Fase 2 – Etapa 3: Bloc avanzado con Freezed y buenas prácticas

Esta etapa está diseñada para consolidar todos los conceptos aprendidos en Bloc, incorporando el paquete `freezed` para modelar estados y eventos inmutables de forma clara, expresiva y segura. También exploraremos buenas prácticas de arquitectura limpia y mantenible para tus Blocs en producción.

---

## 🎯 Objetivos
- Aprender a usar `freezed` para definir eventos y estados
- Modelar estados expresivos: `initial`, `loading`, `success`, `error`
- Aplicar `switch` en pattern matching para renderizar la UI de forma declarativa
- Usar Bloc de manera robusta, tipada y escalable

---

## 📚 Lecturas y materiales complementarios

- 📘 [`freezed_explanation.md`](./freezed_explanation.md): Introducción a `freezed`, cómo declarar clases inmutables y selladas, y qué código genera automáticamente.
- 📘 [`freezed_bloc.md`](./freezed_bloc.md): Comparación entre Bloc clásico y Bloc usando `freezed`. Ejemplo de modernización de eventos y estados.
- 🧪 [`ejemplos/ejemplo_freezed_bloc.dart`](./ejemplo/ejemplo_freezed_bloc.dart): Implementación completa de un Bloc usando `freezed`, ideal como referencia o base de nuevos Blocs.

---

## 🧰 Tips para aplicar buenas prácticas
- Modelá cada estado como un caso distinto (`sealed`) con `freezed`
- Evitá pasar flags como `isLoading`, preferí `state is Loading`
- Mantené los side effects fuera del Bloc (`BlocListener` en la UI)
- Hacé uso del `pattern matching` con `switch`
- Usá `copyWith` para modificar propiedades de forma inmutable

---

Con estas herramientas, podés construir Blocs mucho más expresivos, seguros y mantenibles. ¡Estás un paso más cerca de un código de calidad profesional en BaqueanoApp! 🚀
