import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'solution/fruit_selector_bloc_solution.dart';

// ========== EVENTO ==========
// Crear una clase FruitEvent con solo un tipo de evento llamado SelectedFruitEvent que contenga un campo 'fruit' (tipo String)
class FruitEvent {}

class SelectedFruitEvent extends FruitEvent {
  final String fruit;

  SelectedFruitEvent(this.fruit);
}

// ========== ESTADO ==========
// Crear una clase FruitState que tenga una propiedad 'selectedFruit' y ademas las posibles frutas disponibles 'Manzana', 'Banana' y 'Naranja'.
class FruitState {
  final String selectedFruit;
  final List<String> availableFruits;

  const FruitState({
    required this.selectedFruit,
    required this.availableFruits,
  });
}

// ========== BLOC ==========
// Crear el FruitBloc que extienda Bloc<FruitEvent, FruitState>
//          En el constructor, registrar on<SelectedFruitEvent> y emitir el nuevo estado con la fruta seleccionada
class FruitBloc extends Bloc<FruitEvent, FruitState> {
  FruitBloc()
    : super(
        FruitState(
          selectedFruit: '',
          availableFruits: ['Manzana', 'Banana', 'Naranja'],
        ),
      ) {
    on<SelectedFruitEvent>((event, emit) {
      emit(
        FruitState(
          selectedFruit: event.fruit,
          availableFruits: state.availableFruits,
        ),
      );
    });
  }
}

// ========== UI ==========

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Selector',
      // Instanciar el FruitBloc y darle acceso a la pantalla de selección de frutas.
      home: BlocProvider(
        // creación del bloc de frutas
        create: (context) => FruitBloc(),
        child: const FruitSelectorScreen(),
      ),
    );
  }
}

class FruitSelectorScreen extends StatelessWidget {
  const FruitSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Agregar BlocListener para reaccionar a cambios en el estado y mostrar un SnackBar cuando se seleccione una fruta.
    return BlocListener<FruitBloc, FruitState>(
      listenWhen: (previous, current) =>
          previous.selectedFruit != current.selectedFruit, // cambio de fruta
      listener: (context, state) {
        if (state.selectedFruit.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              // muestra la fruta actual
              content: Text('Seleccionaste: ${state.selectedFruit}'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: // Usar BlocBuilder para construir la UI basada en el estado del Bloc.
      BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Seleccioná tu fruta')),
            body: Row(
              // para que queden botones horizonalmente
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                // Fila de botones de frutas
                for (final fruit in state.availableFruits) ...[
                  ElevatedButton(
                    onPressed: () {
                      // Cada boton debe enviar un evento al Bloc con la fruta seleccionada
                      context.read<FruitBloc>().add(SelectedFruitEvent(fruit));
                    },
                    child: Text(fruit),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const FruitApp());
}
