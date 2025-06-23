# 🧱 Fase 3 – Clean Architecture Adaptada

En esta fase exploraremos la arquitectura que utilizamos internamente en **BaqueanoApp**, basada en
los principios de Clean Architecture pero adaptada a las necesidades de un equipo real de desarrollo
con Flutter.

El objetivo principal es que puedas diseñar y estructurar una aplicación siguiendo una separación
clara de responsabilidades, reutilización de código y facilidad para escalar funcionalidades
futuras.

---

## 🎯 Habilidades que vas a adquirir

- Comprender las capas de responsabilidad en una arquitectura limpia y adaptada.
- Separar correctamente la lógica de negocio (Domain), lógica de aplicación (Application),
  infraestructura (Infrastructure) y la presentación (Presentation).
- Utilizar buenas prácticas para modularizar un proyecto Flutter de forma profesional.
- Aplicar herramientas de inyección de dependencias (`GetIt`, `injectable`) para mantener un
  proyecto desacoplado.

---

## 🧭 Etapas de esta fase

### 1. **Introducción a Clean Architecture clásica**

Veremos el modelo original propuesto por Robert C. Martin y sus capas fundamentales. Lo aplicaremos
con un ejercicio guiado simple que servirá de base para reconocer los elementos clave.

### 2. **Arquitectura adaptada usada en BaqueanoApp**

Exploraremos cómo adaptamos este enfoque en BaqueanoApp, con una capa `Application` que contiene los
blocs/cubits, una capa `Domain` que representa el negocio, una capa `Infrastructure` para conectarse
con fuentes de datos, y una capa `Presentation` que representa la UI. Esta etapa no tiene ejercicio,
ya que su objetivo es comprender la convención de organización del proyecto.

### 3. **Inyección de dependencias con GetIt e Injectable**

Veremos cómo se gestiona la inyección de dependencias en proyectos reales utilizando `GetIt` y
`injectable`, herramientas clave para facilitar el testing y el desacople entre capas. Incluye una
sección explicativa con ejemplos antes/después.

### 4. **Desafío integrador**

Construirás una app simple de "Notas Rápidas" que te permitirá aplicar todo lo aprendido:
arquitectura por capas, uso de Bloc/Cubit y configuración de `injectable`. Este desafío será
evaluado junto con los desafíos integradores de las Fases 1 y 2.

---

Con esta fase estarás listo para construir módulos organizados y escalables en proyectos Flutter
complejos, como los que manejamos en BaqueanoApp 🚀
