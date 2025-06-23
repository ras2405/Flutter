# ✅ Evaluación Final – Proyecto Integrador del Bootcamp

Este proyecto final tiene como objetivo consolidar todos los conocimientos adquiridos a lo largo del
Bootcamp: fundamentos de Dart y Flutter, manejo de estado con Bloc, y Clean Architecture adaptada
con inyección de dependencias.

---

## 🌱 Proyecto: "Mi Huerta Inteligente"

Vas a construir una pequeña aplicación para gestionar una huerta personal. El objetivo es simular
una herramienta que permite al agricultor:

- Registrar nuevos cultivos
- Marcar cultivos como cosechados
- Ver el listado de cultivos activos y cosechados

---

## 🎯 Requisitos funcionales

- Un formulario o campo para **agregar un cultivo** con nombre y fecha de siembra.
- Listado de cultivos separados entre **activos** y **cosechados**.
- Posibilidad de marcar un cultivo como **cosechado** (cambio de estado).

---

## 🧱 Requisitos técnicos obligatorios

- Seguir la **estructura de Clean Architecture adaptada**:
  - `presentation/`, `application/`, `domain/`, `infrastructure/`
  - Todas las carpetas deben estar organizadas dentro de `features/huerta_inteligente/`

- Modelar una entidad `Cultivo` que contenga al menos:
  - `nombre: String`
  - `fechaSiembra: DateTime`
  - `cosechado: bool`

- Separar claramente las responsabilidades:
  - `application/`: Cubit/Bloc que maneje el estado
  - `domain/`: entidad `Cultivo`, repositorio abstracto, y lógica de negocio
  - `infrastructure/`: implementación del repositorio en memoria
  - `presentation/`: UI con al menos un formulario y una lista

- Usar `Bloc` o `Cubit` para manejar el estado
- Usar `freezed` para modelar los estados del Bloc/Cubit y/o eventos
- Usar `injectable` para la inyección de dependencias

---

## 📐 Legibilidad y buenas prácticas

Un criterio fundamental de evaluación será la **legibilidad del código**. Asegurate de:

- Seguir prácticas de *Clean Code*.
- Usar nombres descriptivos para variables, métodos y clases.
- Agregar comentarios donde sea necesario para explicar decisiones o partes importantes.
- Escribir tu código pensando que otra persona lo tendrá que leer y mantener dentro de unos meses.

La claridad en la estructura, nomenclatura y modularidad será tan importante como la funcionalidad
en sí.

---

## 🧪 Entrega

El proyecto debe estar organizado en un único repositorio y ser funcional. Si estás trabajando en el
mismo proyecto donde hiciste los desafíos anteriores, podés agregar este nuevo módulo de huerta como
un nuevo feature.

```bash
lib/
├── features/
│   └── huerta_inteligente/
│       ├── application/
│       ├── domain/
│       ├── infrastructure/
│       └── presentation/
```

---

## 🧠 Opcionales (no obligatorios)

Si querés ir un paso más allá, podés incluir alguno de estos extras:

- Simular persistencia local usando `SharedPreferences` u otro package.
- Separar la UI en múltiples pantallas.
- Agregar validaciones o filtros.
- Escribir un test unitario para la lógica del dominio.

⚠️ **IMPORTANTE**:
- Estos puntos son 100% **opcionales** y **no se espera que estén presentes**.
- Si decidís implementarlos, se valorará tu iniciativa y autonomía, **pero no se evaluará que estén
  100% funcionales o correctos**.
- Si necesitás modificar la lógica para hacer algo opcional, por favor:
  - **No rompas** los requisitos obligatorios.
  - Usá clases alternativas o comentarios para explicar qué harías diferente.

---

## 📚 Recursos sugeridos

- [Widgets Nativas de Flutter](https://docs.flutter.dev/ui/widgets/material)
- [Bloc & Freezed](../fase2_bloc_y_stage_managment/03_freezed_y_buenas_practicas/README.md)
- [Guía de arquitectura adaptada](../fase3_clean_architecture/02_baqueano_app_architecture/README.md)
- [Guía de inyección de dependencias](../fase3_clean_architecture/03_dependency_injection/README.md)

---

¡Mucho éxito! Este proyecto será la pieza final para demostrar todo lo que aprendiste durante el
Bootcamp 🚜✨
