import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/bloc/cultivo_form_bloc.dart';
import '../huerta_inteligente.dart';
import 'lista_cultivos_page.dart';

class RegistroCultivoPage extends StatelessWidget {
  const RegistroCultivoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Cultivo',
      home: BlocProvider(
        create: (context) => getIt<CultivoFormBloc>(), // inicializamos Bloc
        child: const RegistroForm(),
      ),
    );
  }
}

class RegistroForm extends StatefulWidget {
  const RegistroForm({super.key});

  @override
  State<RegistroForm> createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _fechaController = TextEditingController();
  DateTime? _fechaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Huerta Inteligente Form')),
      body: BlocListener<CultivoFormBloc, CultivoFormState>(
        listener: (context, state) {
          state.maybeMap(
            error: (e) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.message)));
            },
            success: (_) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cultivo agregado exitosamente')),
              );
              _nombreController.clear();
              _fechaController.clear();
              _fechaSeleccionada = DateTime.now();
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // El formulario que ve el usuario
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Cultivo',
                    icon: Icon(Icons.grass_sharp),
                  ),
                ),
                TextFormField(
                  controller: _fechaController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de Siembra',
                    icon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final now = DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: DateTime(now.year - 5),
                      lastDate: DateTime(now.year + 5),
                    );
                    if (picked != null) {
                      setState(() {
                        _fechaSeleccionada = picked;
                        _fechaController.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      });
                    }
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<CultivoFormBloc, CultivoFormState>(
                  // Segun state es como reacciona el botón
                  builder: (context, state) {
                    final isProcessing = state.maybeMap(
                      validating: (_) => true,
                      submitting: (_) => true,
                      orElse: () => false,
                    );
                    // Si esta Validando o Enviando, mostramos LoaderIndicator circular
                    return isProcessing
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              context.read<CultivoFormBloc>().add(
                                CultivoFormEvent.submitted(
                                  nombre: _nombreController.text.trim(),
                                  fecha: _fechaSeleccionada,
                                ),
                              );
                            },
                            child: const Text('Enviar'),
                          );
                  },
                ),
                Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ListadoCultivosPage(),
                      ),
                    );
                  },
                  child: const Text('Ver Cultivos'),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
