// bienvenida_repositorio_impl.dart
import 'package:project/features/integrador_fase3/01_fundamentals/domain/repository/bienvenida_repositorio.dart';

import '../domain/entities/mensaje_bienvenida.dart';

class BienvenidaRepositorioImpl implements BienvenidaRepositorio {
  @override
  MensajeBienvenida obtenerMensaje() {
    return MensajeBienvenida("Bienvenido, Juan");
  }
}
