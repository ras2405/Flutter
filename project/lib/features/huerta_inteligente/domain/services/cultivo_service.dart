import 'package:injectable/injectable.dart';

import '../entities/cultivo.dart';
import '../repositories/cultivo_repo.dart';

@injectable
class CultivoService {
  final CultivoRepository _repo;

  CultivoService(this._repo);

  Future<void> agregarCultivo(String nombre, DateTime fecha) async {
    final nuevo = Cultivo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: nombre,
      fechaSiembra: fecha,
    );
    await _repo.agregarCultivo(nuevo);
  }

  Future<void> marcarComoCosechado(Cultivo cultivo) async {
    if (cultivo.cosechado) return;

    final actualizado = cultivo.copyWith(cosechado: true);

    await _repo.actualizarCultivo(actualizado);
  }

  Future<List<Cultivo>> obtenerCultivos() async {
    return await _repo.obtenerCultivos();
  }
}
