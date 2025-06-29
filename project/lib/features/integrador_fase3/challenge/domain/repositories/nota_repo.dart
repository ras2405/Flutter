import '../entities/nota.dart';

abstract class NotaRepository {
  void agregarNota(Nota nota);
  List<Nota> obtenerNotas();
}
