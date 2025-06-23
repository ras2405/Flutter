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
      padding: const EdgeInsets.all(16),
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
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
          ),

          // TODO(3): Espacio entre avatar y texto
          const SizedBox(width: 16),

          // TODO(4): Usá una Column para el nombre y descripción
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Juan Pérez',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Futbolista Profesional',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          // TODO(5): Botón de acción al final que muestre un snackbar al presionarlo
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Mensaje enviado')),
              );
            },
          ),
        ],
      ),
    );
  }
}
