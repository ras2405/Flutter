import '../entities/cultivo.dart';

abstract class CultivoRepository {
  // Registrar nuevo cultivo
  Future<void> agregarCultivo(Cultivo cultivo);

  // Actualizar un cultivo existente
  Future<void> actualizarCultivo(Cultivo cultivo);

  // Método para ver listado de cultivos activos y cosechados
  Future<List<Cultivo>> obtenerCultivos();
}
