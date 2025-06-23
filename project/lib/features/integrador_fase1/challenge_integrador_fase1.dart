import 'package:flutter/material.dart';

void main() {
  runApp(MascotasApp());
}

class MascotasApp extends StatelessWidget {
  const MascotasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Mascotas',
      home: RegistroMascotaScreen(),
    );
  }
}

enum TipoMascota { perro, gato, otro }

class Mascota {
  final String nombre;
  final TipoMascota tipo;
  final int edad;

  Mascota({required this.nombre, required this.tipo, required this.edad});
}

// Registro de Mascota
class RegistroMascotaScreen extends StatefulWidget {
  const RegistroMascotaScreen({super.key});
  @override
  State<RegistroMascotaScreen> createState() => _RegistroMascotaScreenState();
}

class _RegistroMascotaScreenState extends State<RegistroMascotaScreen> {
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();

  TipoMascota? _tipoSeleccionado;

  void _registrarMascota() async {
    bool validName = validateName(_nombreController.text);
    bool validType = validateType(_tipoSeleccionado);
    bool validAge = validateAge(_edadController.text);

    if (validType && validName && validAge) {
      final mascota = Mascota(
        nombre: _nombreController.text.trim(),
        tipo: _tipoSeleccionado!,
        edad: int.parse(_edadController.text),
      );

      final result = await Navigator.push(
        // cambia la ruta
        context,
        MaterialPageRoute(
          builder: (context) => DetalleMascotaScreen(mascota: mascota),
        ),
      );

      if (result == true) {
        // reinicia formulario
        _nombreController.clear();
        _edadController.clear();
        setState(() => _tipoSeleccionado = null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Mascota')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                DropdownButtonFormField<TipoMascota>(
                  value: _tipoSeleccionado,
                  decoration: InputDecoration(labelText: 'Tipo de mascota'),
                  items: TipoMascota.values.map((tipo) {
                    return DropdownMenuItem(
                      value: tipo,
                      child: Text(tipo.name),
                    );
                  }).toList(),
                  onChanged: (tipo) => setState(() => _tipoSeleccionado = tipo),
                ),
                TextFormField(
                  controller: _edadController,
                  decoration: InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registrarMascota,
                  child: Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateName(String text) {
    bool isNotEmpty = true;
    if (text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingrese un nombre'),
          duration: Duration(seconds: 3),
        ),
      );
      isNotEmpty = false;
    }
    return isNotEmpty;
  }

  bool validateAge(String text) {
    bool isValid = true;
    if (text.isEmpty || int.tryParse(text) == null || int.parse(text) <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ingrese una edad válida'),
          duration: Duration(seconds: 3),
        ),
      );
      isValid = false;
    }
    return isValid;
  }

  bool validateType(TipoMascota? tipoSeleccionado) {
    bool isNotNull = true;
    if (tipoSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Seleccione un tipo de mascota'),
          duration: Duration(seconds: 3),
        ),
      );
      isNotNull = false;
    }
    return isNotNull;
  }
}

// Pantalla de Bienvenida
class DetalleMascotaScreen extends StatelessWidget {
  final Mascota mascota;

  const DetalleMascotaScreen({required this.mascota, super.key});

  IconData _iconoPorTipo(TipoMascota tipo) {
    switch (tipo) {
      case TipoMascota.perro:
        return Icons.pets;
      case TipoMascota.gato:
        return Icons.pets_outlined;
      case TipoMascota.otro:
        return Icons.question_mark;
    }
  }

  String _textoEdad(int edad) {
    if (edad < 2 && edad > 0) {
      return 'Joven 🐣';
    } else {
      return 'Adulto 🐾';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenida')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(_iconoPorTipo(mascota.tipo), size: 100),
              SizedBox(height: 20),
              Text(
                '¡Bienvenido ${mascota.nombre} el ${mascota.tipo.name}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                _textoEdad(mascota.edad),
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              Spacer(),
              ElevatedButton.icon(
                // pantalla anterior
                onPressed: () => Navigator.pop(context, true),
                icon: Icon(Icons.arrow_back),
                label: Text('Registrar otra mascota'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
