import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ========== EVENTO ==========
// TODO: Crear una clase FruitEvent con solo un tipo de evento llamado SelectedFruitEvent que contenga un campo 'fruit' (tipo String)

// ========== ESTADO ==========
// TODO: Crear una clase FruitState que tenga una propiedad 'selectedFruit' y ademas las posibles frutas disponibles 'Manzana', 'Banana' y 'Naranja'.

// ========== BLOC ==========
// TODO: Crear el FruitBloc que extienda Bloc<FruitEvent, FruitState>
//          En el constructor, registrar on<SelectedFruitEvent> y emitir el nuevo estado con la fruta seleccionada

// ========== UI ==========

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Selector',
      //TODO: Instanciar el FruitBloc y darle acceso a la pantalla de selección de frutas.
      home: const FruitSelectorScreen(),
    );
  }
}

class FruitSelectorScreen extends StatelessWidget {
  const FruitSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Usar BlocBuilder para construir la UI basada en el estado del Bloc.
    //TODO: Agregar BlocListener para reaccionar a cambios en el estado y mostrar un SnackBar cuando se seleccione una fruta.
    return Scaffold(
      appBar: AppBar(title: const Text('Seleccioná tu fruta')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Fila de botones de frutas
          for (final fruit in ['frutas disponibles']) ...[
            ElevatedButton(
              onPressed: () {
                //TODO: Cada boton debe enviar un evento al Bloc con la fruta seleccionada
              },
              child: Text(fruit),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}
