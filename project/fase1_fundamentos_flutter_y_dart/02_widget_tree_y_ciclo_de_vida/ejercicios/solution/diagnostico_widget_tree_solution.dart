import 'package:flutter/material.dart';

/// TODO Consigna:
//   1.  Identifica el error relacionado con el uso del BuildContext.
//   2.  Explica por qué es riesgoso.
//   3.  Corrige el código respetando buenas prácticas de ciclo de vida.

void main() {
  runApp(const MaterialApp(home: DiagnosticPage()));
}

class DiagnosticPage extends StatefulWidget {
  const DiagnosticPage({super.key});

  @override
  State<DiagnosticPage> createState() => _DiagnosticPageState();
}

class _DiagnosticPageState extends State<DiagnosticPage> {
  bool _loading = false;

  Future<void> _simulateAsyncAction() async {
    //Dos formas de manejar el contexto en acciones asíncronas:
    // 1. Buscar el ScaffoldMessenger antes de la acción asíncrona.
    // 2. Verificar si el contexto sigue montado antes de usarlo.
    // _simulateAsyncActionVersionA(); o _simulateAsyncActionVersionB();
    await _simulateAsyncActionVersionA();
  }

  Future<void> _simulateAsyncActionVersionA() async {
    setState(() {
      _loading = true;
    });

    // De esta manera, buscamos el ScaffoldMessenger antes de que se complete la acción asíncrona.
    // Estamos seguros de que el contexto es válido en este punto.
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await Future.delayed(const Duration(seconds: 3));

    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('¡Operación completada!')),
    );

    setState(() {
      _loading = false;
    });
  }

  Future<void> _simulateAsyncActionVersionB() async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    if (!context.mounted) {
      // Verificamos si el contexto sigue montado (y por lo tanto valido) antes de mostrar el SnackBar.
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('¡Operación completada!')));

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diagnóstico de Context')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: _simulateAsyncAction,
          child: const Text('Ejecutar acción async'),
        ),
      ),
    );
  }
}
