import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project/features/integrador_fase3/challenge/application/cubit/notas_state.dart';
import 'package:project/features/integrador_fase3/challenge/domain/services/gestor_notas.dart';

@injectable
class NotasCubit extends Cubit<NotasState> {
  final GestorNotas _gestorNotas;
  NotasCubit(this._gestorNotas) : super(NotasState([]));

  void agregarNota(String nota) {
    _gestorNotas.crearNota(nota);
    // devolvemos la lista actualizada
    emit(NotasState(_gestorNotas.listarNotas()));
  }
}
