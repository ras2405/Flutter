// mensaje_widget.dart
import 'package:flutter/material.dart';

import 'obtener_mensaje.dart';

class MensajeWidget extends StatelessWidget {
  const MensajeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final obtenerMensaje = ObtenerMensaje();
    final mensaje = obtenerMensaje();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Mensaje de Bienvenida")),
        body: Center(child: Text(mensaje.valor)),
      ),
    );
  }
}








