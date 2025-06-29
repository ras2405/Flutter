import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/cultivo.dart';
import '../../domain/services/cultivo_service.dart';

// dart run build_runner build --delete-conflicting-outputs
part 'cultivo_form_bloc.freezed.dart';
part 'cultivo_form_event.dart';
part 'cultivo_form_state.dart';

@injectable
class CultivoFormBloc extends Bloc<CultivoFormEvent, CultivoFormState> {
  final CultivoService _cultivoService;

  CultivoFormBloc(this._cultivoService) : super(CultivoFormState.initial()) {
    on<CultivoSubmitted>((event, emit) async {
      emit(const CultivoFormState.validating());

      // Validación del nombre
      if (event.nombre.isEmpty) {
        emit(const CultivoFormState.error('El nombre es obligatorio'));
        return;
      } else if (event.fecha == null) {
        emit(
          const CultivoFormState.error(
            'Seleccionar fecha de siembra es obligatorio',
          ),
        );
        return;
      } else {
        emit(const CultivoFormState.submitting());
        await _cultivoService.agregarCultivo(event.nombre, event.fecha!);
        emit(const CultivoFormState.success());
      }
    });
  }
}
