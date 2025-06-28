// obtener_mensaje.dart
import '../../domain/repository/Ibienvenida_repositorio.dart';
import '../entities/mensaje_bienvenida.dart';

class ObtenerMensaje {
  final IBienvenidaRepositorio _repositorio;

  ObtenerMensaje(this._repositorio);

  MensajeBienvenida call() {
    return _repositorio.obtenerMensaje();
  }
}
