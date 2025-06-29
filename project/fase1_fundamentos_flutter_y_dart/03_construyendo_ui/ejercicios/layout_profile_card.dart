// 🧪 Ejercicio guiado – Tarjeta de perfil
// Instrucciones:
// Completá los TODOs para construir una tarjeta de perfil alineada correctamente.
// Deberías utilizar widgets de layout como Row, Column, Container, SizedBox y Padding.

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: Center(child: ProfileCard())),
    ),
  );
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Agregá padding alrededor del contenido
      padding: const EdgeInsets.all(16), // 16 pixeles
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
          // Agregá un avatar circular con una imagen de red por ejemplo desde el link: https://i.pravatar.cc/150?img=1
          CircleAvatar(
            radius: 30, // Radio del avatar
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            // CORS unblock extension en edge para visualizar imagen
          ),
          // Espacio entre el avatar y el texto
          const SizedBox(width: 16),
          // Usá una Column para el nombre y descripción
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // alineación a la izquierda
              mainAxisSize: MainAxisSize.min, // evitar ocupar todo el espacio
              children: [
                Text(
                  'Juan Pérez',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4), // Espacio entre nombre y descripción
                Text(
                  'Futbolista profesional',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // const Spacer(), // Espacio flexible para empujar el botón al final
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Mandar mensaje'),
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            icon: const Icon(Icons.comment),
          ),
        ],
      ),
    );
  }
}
