// obtener_mensaje.dart
import 'bienvenida_repositorio.dart';
import 'mensaje_bienvenida.dart';

class ObtenerMensaje {
  final _repositorio = BienvenidaRepositorio();

  MensajeBienvenida call() {
    return _repositorio.obtenerMensaje();
  }
}