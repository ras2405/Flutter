// mensaje_widget.dart
import 'package:flutter/material.dart';

import '../../domain/usecases/obtener_mensaje.dart';

class MensajeWidget extends StatelessWidget {
  final ObtenerMensaje obtenerMensaje;

  const MensajeWidget(this.obtenerMensaje, {super.key});
  // inyección de dependencias para no llamar al repo directamente

  @override
  Widget build(BuildContext context) {
    final mensaje = obtenerMensaje();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Mensaje de Bienvenida")),
        body: Center(child: Text(mensaje.valor)),
      ),
    );
  }
}
