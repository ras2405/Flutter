import 'package:injectable/injectable.dart';

import '../../domain/entities/cultivo.dart';
import '../../domain/repositories/cultivo_repo.dart';

@LazySingleton(as: CultivoRepository)
class CultivoRepositoryImpl implements CultivoRepository {
  final List<Cultivo> _cultivos = []; // en memoria

  @override
  Future<void> agregarCultivo(Cultivo cultivo) async => _cultivos.add(cultivo);

  @override
  Future<void> actualizarCultivo(Cultivo cultivo) async {
    final index = _cultivos.indexWhere((c) => c.nombre == cultivo.nombre);
    if (index != -1) {
      _cultivos[index] = cultivo;
    }
  }

  @override
  Future<List<Cultivo>> obtenerCultivos() async => _cultivos;
}
