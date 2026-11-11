# Formulario C - Flutter Form Builder

Aplicación de la Actividad 3 de M0489. El formulario está creado desde cero utilizando el paquete `flutter_form_builder` y sigue los controles que aparecen en el ejemplo C del PPT.

## Campos del formulario

- **Choice Chips:** permite seleccionar una opción entre Flutter, Android y Chrome OS.
- **Switch:** interruptor para activar o desactivar una opción.
- **Text Field:** campo de texto con un límite de 15 caracteres.
- **Dropdown Field:** menú desplegable con tres opciones de ejemplo.
- **Radio Group Model:** permite seleccionar una opción entre cuatro.

El botón flotante guarda y valida los datos y los muestra en una ventana emergente.

## Antes de ejecutar

1. Abre la carpeta del proyecto en VS Code.
2. En `lib/main.dart`, sustituye `Nom i Cognoms` por tu nombre y apellidos.
3. Abre el terminal en la carpeta del proyecto y ejecuta:

```bash
flutter pub get
flutter run
```

## Dependencia principal

El proyecto utiliza `flutter_form_builder: ^10.2.0`, la misma versión que el proyecto Form A de referencia.
