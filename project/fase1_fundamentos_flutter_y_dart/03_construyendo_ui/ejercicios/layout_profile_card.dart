// 🧪 Ejercicio guiado – Tarjeta de perfil
// Instrucciones:
// Completá los TODOs para construir una tarjeta de perfil alineada correctamente.
// Deberías utilizar widgets de layout como Row, Column, Container, SizedBox y Padding.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProfileCard(),
      ),
    ),
  ));
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO(1): Agregá padding alrededor del contenido
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // TODO(2): Agregá un avatar circular con una imagen de red por ejemplo desde el link: https://i.pravatar.cc/150?img=1

          // TODO(3): Espacio entre avatar y texto

          // TODO(4): Usá una Column para el nombre y descripción

          // TODO(5): Botón de acción al final que muestre un snackbar al presionarlo
        ],
      ),
    );
  }
}
