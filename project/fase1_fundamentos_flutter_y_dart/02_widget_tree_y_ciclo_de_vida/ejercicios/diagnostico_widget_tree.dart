import 'package:flutter/material.dart';

/// Consigna:
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
    setState(() {
      _loading = true;
    });

    final BuildContext context = this.context;

    await Future.delayed(const Duration(seconds: 3));

    // **Error**:
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('¡Operación completada!')),
    // );
    // Usar context después de un await (como al usar un Future Method en este caso)
    // tiene el riesgo de estar apuntando a un contexto que fue reconstruido o disposed,
    // puede filtrar memoria y causar errores (app crashes por ejemplo).
    // Referencia: https://medium.com/nerd-for-tech/do-not-use-buildcontext-in-async-gaps-why-and-how-to-handle-flutter-context-correctly-870b924eb42e

    // **Corrección**:
    if (context.mounted) {
      // 'mounted' usado para verificar si context sigue activo
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('¡Operación completada!')));
    }
    // Referencia: https://dart.dev/tools/diagnostics/use_build_context_synchronously

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
