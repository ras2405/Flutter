import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_integrador_fase2.freezed.dart';

// dart run build_runner build --delete-conflicting-outputs

// Events
@freezed
sealed class FormularioEvent with _$FormularioEvent {
  // Cada evento extiende de FormularioEvent
  const factory FormularioEvent.nameChanged(String name) = NameChanged;
  const factory FormularioEvent.emailChanged(String email) = EmailChanged;
  const factory FormularioEvent.messageChanged(String message) = MessageChanged;
  const factory FormularioEvent.submitted({
    // Junta los 3 eventos
    required String name,
    required String email,
    required String message,
  }) = FormSubmitted;
}

// States (usando sealed classes)
@freezed
sealed class FormularioState with _$FormularioState {
  const factory FormularioState.initial() = _Initial;
  const factory FormularioState.validating() = _Validating;
  const factory FormularioState.submitting() = _Submitting;
  const factory FormularioState.success() = _Success;
  const factory FormularioState.error(String message) = _Error;
}

// Bloc
final class FormBloc extends Bloc<FormularioEvent, FormularioState> {
  String _name = '';
  String _email = '';
  String _message = '';

  FormBloc() : super(const FormularioState.initial()) {
    on<NameChanged>((event, emit) {
      _name = event.name;
    });

    on<EmailChanged>((event, emit) {
      _email = event.email;
    });

    on<MessageChanged>((event, emit) {
      _message = event.message;
    });

    on<FormSubmitted>((event, emit) async {
      emit(const FormularioState.validating());
      // Hacemos las validaciones de los 3 campos
      // Nombre con 3 caracteres mínimo
      if (_name.length < 3) {
        emit(
          const FormularioState.error('Name should have at least 3 characters'),
        );
        return;
      }
      // Email con '@' y '.'
      if (!_email.contains('@') || !_email.contains('.')) {
        emit(const FormularioState.error('Email must contain "@" and "."'));
        return;
      }
      // Mensaje no vacio
      if (_message.isEmpty) {
        emit(const FormularioState.error('Message should not be empty'));
        return;
      }

      // Caso ok
      emit(const FormularioState.submitting()); // Simulamos que carga
      await Future.delayed(const Duration(seconds: 2));
      emit(const FormularioState.success()); // Emitimos caso ok
    });
  }
}

// UI
class BlocFreezedApp extends StatelessWidget {
  const BlocFreezedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge Integrador Fase 2',
      home: BlocProvider(
        create: (context) => FormBloc(), // Inicializamos el FormBloc
        child: const FormularioScreen(), // Pantalla del formulario
      ),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: BlocListener<FormBloc, FormularioState>(
        listener: (context, state) {
          // Escuchamos los cambios del state del FormBloc
          // Acá es donde mandamos los snackbar
          if (state is _Success) {
            // Ocultamos el snackbar que ya se mostraba
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            // Nuevo snackbar con mensaje de éxito
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Correctly submitted')));
          } else if (state is _Error) {
            // Ocultamos el snackbar que ya se mostraba
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            // Nuevo snackbar con error
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // El formulario que ve el usuario
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    icon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    // Enviamos evento al Bloc con el Nombre ingresado
                    context.read<FormBloc>().add(
                      FormularioEvent.nameChanged(value),
                    );
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  onChanged: (value) {
                    // Enviamos evento al Bloc con el Email ingresado
                    context.read<FormBloc>().add(
                      FormularioEvent.emailChanged(value),
                    );
                  },
                ),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: 'Mensaje',
                    icon: Icon(Icons.message),
                  ),
                  onChanged: (value) {
                    // Enviamos evento al Bloc con el Mensaje ingresado
                    context.read<FormBloc>().add(
                      FormularioEvent.messageChanged(value),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<FormBloc, FormularioState>(
                  // Segun state es como reacciona el botón
                  builder: (context, state) {
                    final isProcessing =
                        state is _Validating || state is _Submitting;
                    // Si esta Validando o Enviando, mostramos LoaderIndicator circular
                    return isProcessing
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              context.read<FormBloc>().add(
                                FormularioEvent.submitted(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  message: _messageController.text,
                                ),
                              );
                            },
                            child: const Text('Enviar'),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
