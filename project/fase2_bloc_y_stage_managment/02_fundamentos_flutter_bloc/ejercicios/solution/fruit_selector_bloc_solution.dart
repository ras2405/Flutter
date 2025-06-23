import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ========== EVENTO ==========
// TODO: Crear una clase FruitEvent con solo un tipo de evento llamado SelectedFruitEvent que contenga un campo 'fruit' (tipo String)
sealed class FruitEvent {}

final class SelectedFruitEvent extends FruitEvent {
  final String fruit;

  SelectedFruitEvent(this.fruit);
}

// ========== ESTADO ==========
// TODO: Crear una clase FruitState que tenga una propiedad 'selectedFruit' y ademas las posibles frutas disponibles.
final class FruitState {
  final String selectedFruit;
  final List<String> availableFruits;

  const FruitState({
    required this.selectedFruit,
    required this.availableFruits,
  });
}

// ========== BLOC ==========
// TODO: Crear el FruitBloc que extienda Bloc<FruitEvent, FruitState>
//          En el constructor, registrar on<SelectedFruitEvent> y emitir el nuevo estado con la fruta seleccionada y
//          inicializar el estado con las frutas disponibles  'Manzana', 'Banana' y 'Naranja'

final class FruitBloc extends Bloc<FruitEvent, FruitState> {
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
      //TODO: Instanciar el FruitBloc y darle acceso a la pantalla de selección de frutas.
      home: BlocProvider(
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
    //TODO: Usar BlocBuilder para construir la UI basada en el estado del Bloc.
    //TODO: Agregar BlocListener para reaccionar a cambios en el estado y mostrar un SnackBar cuando se seleccione una fruta.
    return BlocListener<FruitBloc, FruitState>(
      //Alternativamente, puedes usar BlocConsumer para combinar BlocBuilder y BlocListener
      listenWhen: (previous, current) {
        // Solo escuchar cambios cuando la fruta seleccionada cambie
        return previous.selectedFruit != current.selectedFruit;
      },
      listener: (context, state) {
        if (state.selectedFruit.isNotEmpty) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fruta seleccionada: ${state.selectedFruit}')),
          );
        }
      },
      child: BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Seleccioná tu fruta')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Fila de botones de frutas
                for (final fruit in state.availableFruits) ...[
                  ElevatedButton(
                    onPressed: () {
                      //TODO: Cada boton debe enviar un evento al Bloc con la fruta seleccionada
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
