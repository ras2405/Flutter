# 🧱 Fase 3 – Etapa 2: Arquitectura adaptada en BaqueanoApp

En esta etapa explicamos la versión adaptada de Clean Architecture que utilizamos internamente en **BaqueanoApp**. Esta estructura busca mantener la separación de responsabilidades de forma clara, manteniendo la practicidad para equipos medianos y proyectos Flutter reales.

---

## 🧩 Las 4 capas de BaqueanoApp

### 1. **Application**
Esta capa contiene toda la lógica de coordinación entre la UI y el dominio.

- **Bloc / Cubit** viven aquí, actuando como mediadores entre la interfaz y las reglas de negocio.

### 2. **Domain**
Es la capa más pura, sin dependencias externas. Contiene:

- **entities/**: Clases que representan conceptos del negocio, independientes de infraestructura.
- **services/**: Controladores que orquestan lógica compleja entre entidades y repositorios.
- **repositories/**: Interfaces que definen los contratos que deberán implementar las capas inferiores.

Esta capa es consumida por Application y define los contratos para Infrastructure.

### 3. **Infrastructure**
Es el equivalente a la capa de datos. Contiene:

- **repositories/**: Implementaciones concretas de las interfaces definidas en Domain. Por ejemplo, acceso a bases de datos o APIs.
- **dtos/**: Data Transfer Objects, que actúan como adaptadores entre la representación de datos (e.g. JSON) y las entidades del dominio.

### 4. **Presentation**
Esta capa contiene todo el código de interfaz de usuario: pantallas, widgets, estilos y layouts.

- Interactúa con los Cubits/Blocs definidos en Application.
- Su responsabilidad es renderizar el estado y propagar eventos de interacción hacia la lógica.

---

## 🔄 Equivalencias con Clean Architecture

Para clarificar el paralelismo entre esta versión adaptada y la Clean Architecture clásica:

| BaqueanoApp Architecture | Equivalente en Clean Architecture                      |
|--------------------------|--------------------------------------------------------|
| Presentation             | Presentation                                           |
| Application              | Presentation -> Presentation Logic Holder (e.g., Bloc) |
| Domain -> Services       | Domain -> Use Cases                                    |
| Domain -> Entities       | Domain -> Entities                                     |
| Infrastructure           | Data Layer (DTOs, Repository Implementations)          |

Esto facilita mapear conocimientos previos o recursos externos al modelo que usamos internamente.

---

## 🧰 Ejemplo de estructura de carpetas sugerida

```bash
lib/
├── features/
│   └── animales/
│       ├── application/
│       │   └── cubit/
│       │       └── animal_cubit.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── animal.dart
│       │   ├── services/
│       │   │   └── animal_manager.dart
│       │   └── repositories/
│       │       └── animal_repository.dart
│       ├── infrastructure/
│       │   ├── dtos/
│       │   │   └── animal_dto.dart
│       │   └── repositories/
│       │       └── animal_repository_impl.dart
│       └── presentation/
│           ├── pages/
│           │   └── animal_list_screen.dart
│           └── widgets/
│               └── animal_card.dart
```

---

Esta estructura modularizada permite trabajar en equipos, reutilizar lógica, y facilitar tests, especialmente cuando se aplica junto a `freezed`, `bloc`, y herramientas como `get_it` para inyección de dependencias.

👉 En la siguiente etapa vas a conocer qué es `GetIt` e `injectable` y cómo lo usamos en BaqueanoApp.
