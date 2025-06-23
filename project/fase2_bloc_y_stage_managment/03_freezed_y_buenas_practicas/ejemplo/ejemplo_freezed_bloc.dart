import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ejemplo_freezed_bloc.freezed.dart';

// ========== EVENTO ==========
// TODO: Crear una clase FruitEvent con solo un tipo de evento llamado SelectedFruitEvent que contenga un campo 'fruit' (tipo String)
@freezed
sealed class FruitEvent with _$FruitEvent {
  const factory FruitEvent.selectedFruit(String addedFruit) =
  SelectedFruitEvent;

  const factory FruitEvent.removeFruit(String removedFruit) = RemoveFruitEvent;
}

// ========== ESTADO ==========
// TODO: Crear una clase FruitState que tenga una propiedad 'selectedFruit' y ademas las posibles frutas disponibles.
@freezed
abstract class FruitState with _$FruitState {
  const factory FruitState({
    required String selectedFruit,
    required List<String> availableFruits,
  }) = _FruitState;
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
    //Esto es una manera de declarar los handlers de eventos
    // on<SelectedFruitEvent>((event, emit) {
    //   emit(
    //     FruitState(
    //       selectedFruit: event.fruit,
    //       availableFruits: state.availableFruits,
    //     ),
    //   );
    // });
    // on<RemoveFruitEvent>((event, emit) {
    //   final updatedFruits = List<String>.from(state.availableFruits);
    //   updatedFruits.remove(event.fruit);
    //   print('Removing fruit: ${event.fruit}');
    //
    //   emit(state.copyWith(availableFruits: updatedFruits));
    // });

    //Otra manera es utilizando la sealed class que freezed genero por detras Freezed
    on<FruitEvent>((event, emit) {
      switch (event) {
        case SelectedFruitEvent():
          emit(state.copyWith(selectedFruit: event.addedFruit));
          break;
        case RemoveFruitEvent():
          final updatedFruits = List<String>.from(state.availableFruits);
          updatedFruits.remove(event.removedFruit);
          print('Removing fruit: ${event.removedFruit}');

          emit(state.copyWith(availableFruits: updatedFruits));
          break;
      }
    });
  }
}

void main() {
  final bloc = FruitBloc();
  //Mostramos propiedades de Freezed
  print('Available Fruits: ${bloc.state.availableFruits}');

  print('Selected Fruit: ${bloc.state.selectedFruit}');

  final stateActual = bloc.state;

  final stateFrutaCambiada = stateActual.copyWith(selectedFruit: 'Manzana');

  print('Selected Fruit after copyWith: ${stateFrutaCambiada.selectedFruit}');

  bloc.stream.listen((state) {
    print(
      'New state: ${state.selectedFruit}, Available Fruits: ${state.availableFruits}',
    );
  });
  bloc.add(FruitEvent.removeFruit('Banana'));
}
