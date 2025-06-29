import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/cultivo.dart';
import '../../domain/services/cultivo_service.dart';
import 'huerta_state.dart';

@injectable
class HuertaCubit extends Cubit<HuertaState> {
  final CultivoService _service; // logica de negocio

  HuertaCubit(this._service) : super(HuertaState.initial()) {
    cargarCultivos();
  }

  Future<void> cargarCultivos() async {
    final cultivos = await _service.obtenerCultivos();
    emit(state.copyWith(cultivos: cultivos));
  }

  Future<void> agregarCultivo(String nombre, DateTime fecha) async {
    await _service.agregarCultivo(nombre, fecha);
    await cargarCultivos();
  }

  Future<void> marcarComoCosechado(Cultivo cultivo) async {
    await _service.marcarComoCosechado(cultivo);
    await cargarCultivos();
  }
}
