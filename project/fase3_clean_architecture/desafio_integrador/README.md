# 📝 Desafío Integrador – Fase 3: Arquitectura Adaptada con Injectable

Este desafío tiene como objetivo aplicar todo lo aprendido en la Fase 3 del Bootcamp, enfocándose en
la correcta organización del código siguiendo la arquitectura adaptada de BaqueanoApp y utilizando
`GetIt` e `injectable` para la inyección de dependencias.

---

## 🎯 Objetivo

Construir una aplicación sencilla llamada **Notas Rápidas**, que permita crear y listar notas
breves. No se requiere persistencia ni funcionalidades avanzadas.

---

## 🧩 Requisitos funcionales

- Crear una nueva nota escribiendo un texto breve.
- Mostrar en pantalla todas las notas creadas.
- Las notas pueden mantenerse simplemente en memoria (no persisten entre reinicios).

---

## 🧱 Requisitos técnicos

- Usar **la estructura de carpetas** basada en la arquitectura BaqueanoApp
- Definir una entidad `Nota` simple en `domain/entities` con un único campo `String contenido`.
- Crear un servicio `GestorNotas` que use un repositorio para crear y listar notas.
- Implementar el repositorio en memoria en `infrastructure/repositories`.
- Definir el `NotasCubit` en `application/cubit/` que controle la UI.
- Crear una pantalla simple con `BlocBuilder` para mostrar notas y un `TextField` + botón para
  agregar nuevas.

---

## 🔌 Inyección de dependencias

- Usar `GetIt` e `Injectable` para registrar las dependencias:
    - `NotaRepositoryImpl` debe estar anotado con `@LazySingleton(as: NotaRepository)`.
    - `GestorNotas` y `NotasCubit` deben estar anotados con `@injectable`.

Recordá generar el archivo de configuración con:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🧠 Criterios de evaluación

1. Estructura clara según arquitectura adaptada
2. Uso correcto de Bloc o Cubit
3. Aplicación de inyección con Injectable / GetIt
4. Funcionamiento funcional básico completo
5. Código limpio, legible y modularizado

---

## 📝 Notas importantes

- Podés buscar información adicional donde lo necesites: documentación oficial, artículos, videos o herramientas como IA.
- Si tenés dudas puntuales o necesitás ayuda para desbloquearte, no dudes en contactar al referente del Bootcamp.

---

¡Mucho éxito! Este desafío consolidará tu comprensión de una arquitectura profesional real usada en
Flutter. 🚀
