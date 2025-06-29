import 'package:injectable/injectable.dart';
import '../entities/nota.dart';
import '../repositories/nota_repo.dart';

@injectable
class GestorNotas {
  // Creamos nueva instancia
  final NotaRepository _repo;
  GestorNotas(this._repo);

  void crearNota(String contenido) {
    _repo.agregarNota(Nota(contenido));
  }

  List<Nota> listarNotas() {
    return _repo.obtenerNotas();
  }
}
