# 🧪 Desafío Integrador – Formulario reactivo con Bloc y Freezed

Este challenge final pone a prueba todo lo aprendido en la Fase 2. Tendrás que construir un
formulario de contacto reactivo, validado, y modelado con estados expresivos utilizando Bloc y
Freezed.

---

## 🎯 Objetivo

Crear una pantalla donde el usuario pueda:

- Ingresar su **nombre**, **email** y **mensaje**
- Validar esos campos con lógica controlada por Bloc
- Enviar el formulario y simular una respuesta de éxito o error
- Mostrar feedback visual (loader, SnackBar de resultado)

---

## 🧠 Reglas de validación

- Nombre: mínimo 3 caracteres
- Email: debe contener "@" y un punto
- Mensaje: no puede estar vacío

---

## 🧱 Requerimientos técnicos

### 🎯 Bloc

- Usar `Bloc` (no `Cubit`) para manejar eventos y estados
- Modelar eventos y estados usando `freezed`

### 📦 Eventos esperados

- `NameChanged`
- `EmailChanged`
- `MessageChanged`
- `FormSubmitted`

### 🔁 Estados esperados (sealed classes)

- `initial`
- `validating`
- `submitting`
- `success`
- `error(String message)`

### 🧪 Comportamiento

- Al presionar enviar:
    - Si los valores del formulario son válidos, se debe mostrar un SnackBar de error
    - Mientras se valida, se debe deshabilitar el botón de enviar y mostrar un LoaderIndicator
    - Si el formulario es válido:
        - Se debe mostrar un loader durante 2 segundos (simulación) mientras procesa deshabilitando
          el botón de envío
        - Mostrar un `SnackBar` de éxito con el mensaje "Formulario enviado correctamente"

---

## 🧰 Tips

- Podés usar `Form` y `TextFormField`, pero evitá lógica directamente en los widgets
- Toda la lógica de validación debe estar en el Bloc
- Usá `BlocBuilder` para reaccionar a los cambios de estado
- Usá `BlocListener` para mostrar SnackBars y loaders

---

## 📌 Notas importantes

Este desafío requerirá que investigues por tu cuenta algunos elementos que aún no vimos directamente
en el bootcamp:

- Cómo funciona `Form` y `TextFormField` en Flutter
- Validación de formularios
- Mostrar y ocultar `SnackBar` y `CircularProgressIndicator`

Se espera que puedas usar documentación oficial, videos explicativos, ejemplos de código y/o
consultas al referente para completar los puntos que no hayan sido abordados aún.

---

## ✅ Entrega

Este ejercicio debe agregarse dentro del mismo proyecto que usaste en las etapas anteriores.

¡Mucho éxito! Este ejercicio demuestra tu capacidad para construir UI declarativa y lógica de
negocios escalable en Flutter 🚀
