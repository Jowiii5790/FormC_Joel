import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M0489 - Apps - Form (C)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Clave para recuperar y validar los datos de todos los campos.
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Sustituye este texto por tu nombre y apellidos, como pide el PPT.
        title: const Text('Joel Valero Torrubia'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Permite seleccionar una opción mediante Choice Chips.
                FormBuilderChoiceChips<String>(
                  name: 'choice_chips',
                  initialValue: 'Flutter',
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  decoration: const InputDecoration(
                    labelText: 'Choice Chips',
                    border: OutlineInputBorder(),
                  ),
                  options: const <FormBuilderChipOption<String>>[
                    FormBuilderChipOption(
                      value: 'Flutter',
                      child: Text('Flutter'),
                    ),
                    FormBuilderChipOption(
                      value: 'Android',
                      child: Text('Android'),
                    ),
                    FormBuilderChipOption(
                      value: 'Chrome OS',
                      child: Text('Chrome OS'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Interruptor para activar o desactivar una opcipon.
                FormBuilderSwitch(
                  name: 'switch',
                  title: const Text('This is a switch'),
                  initialValue: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Campo de texto con un limite de 15 caracteres
                FormBuilderTextField(
                  name: 'text_field',
                  maxLength: 15,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  decoration: const InputDecoration(
                    labelText: 'Text Field',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length > 15) {
                      return 'Value must have a length less than or equal to 15';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Menú desplegable para seleccionar una opcion
                FormBuilderDropdown<String>(
                  name: 'dropdown',
                  decoration: const InputDecoration(
                    labelText: 'Dropdown Field',
                    border: OutlineInputBorder(),
                  ),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'Option 1',
                      child: Text('Option 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 2',
                      child: Text('Option 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Option 3',
                      child: Text('Option 3'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Grupo de botones de seleccion con una opcion
                FormBuilderRadioGroup<String>(
                  name: 'radio_group',
                  decoration: const InputDecoration(
                    labelText: 'Radio Group Model',
                    border: OutlineInputBorder(),
                  ),
                  orientation: OptionsOrientation.vertical,
                  options: const <FormBuilderFieldOption<String>>[
                    FormBuilderFieldOption(
                      value: 'Option 1',
                      child: Text('Option 1'),
                    ),
                    FormBuilderFieldOption(
                      value: 'Option 2',
                      child: Text('Option 2'),
                    ),
                    FormBuilderFieldOption(
                      value: 'Option 3',
                      child: Text('Option 3'),
                    ),
                    FormBuilderFieldOption(
                      value: 'Option 4',
                      child: Text('Option 4'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final formState = _formKey.currentState;

          // Guarda y valida el formulario antes de mostrar el resultado.
          if (formState == null || !formState.saveAndValidate()) {
            return;
          }

          // Recupera los valores de los campos.
          final formValues = formState.value;
          final formText = formValues.entries
              .map((entry) => '${entry.key}: ${entry.value ?? '-'}')
              .join('\n');

          // Muestra las respuestas en una ventana emergente.
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: const Text('Formulari enviat'),
                content: SingleChildScrollView(
                  child: Text(formText),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('Tancar'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Enviar formulari',
        child: const Icon(Icons.upload),
      ),
    );
  }
}
