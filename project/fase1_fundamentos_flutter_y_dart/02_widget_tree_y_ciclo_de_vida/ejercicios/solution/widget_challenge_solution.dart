import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ✔️ Punto de entrada de la app.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Lifecycle Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(title: 'Ciclo de vida en Flutter', showCounter: true),
    );
  }
}

// ✔️ Página principal, StatefulWidget.
class MyHomePage extends StatefulWidget {
  final String title;

  // 🔄 Esta propiedad será usada para mostrar u ocultar el contador.
  final bool showCounter;

  const MyHomePage({super.key, required this.title, required this.showCounter});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 🧠 Acá ocurre la magia del ciclo de vida.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // TODO(1): Imprimir en consola "initState ejecutado" dentro de este método.
  @override
  void initState() {
    super.initState();
    debugPrint('initState ejecutado');
  }

  // TODO(2): Detectar si cambió `showCounter` usando didUpdateWidget.
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showCounter != widget.showCounter) {
      debugPrint('showCounter cambió de ${oldWidget.showCounter} a ${widget.showCounter}');
    }
  }

  // TODO(3): Imprimir en consola "dispose ejecutado" al destruir el widget.
  @override
  void dispose() {
    debugPrint('dispose ejecutado');
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      // TODO(4): Mostrar un SnackBar si el contador alcanza 5.
      if (_counter == 5) {
        debugPrint('SnackBar mostrado porque el contador alcanzó 5');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('¡Has alcanzado 5!'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.showCounter) ...[
              const Text('Has presionado el botón esta cantidad de veces:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ] else
              const Text('El contador está oculto'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
