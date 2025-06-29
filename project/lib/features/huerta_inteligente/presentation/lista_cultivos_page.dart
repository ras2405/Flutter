import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/cubit/huerta_cubit.dart';
import '../application/cubit/huerta_state.dart';
import '../domain/entities/cultivo.dart';

class ListadoCultivosPage extends StatefulWidget {
  const ListadoCultivosPage({super.key});

  @override
  State<ListadoCultivosPage> createState() => _ListadoCultivosPageState();
}

class _ListadoCultivosPageState extends State<ListadoCultivosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Cultivos')),
      body: BlocBuilder<HuertaCubit, HuertaState>(
        builder: (context, state) {
          final activos = state.cultivos.where((c) => !c.cosechado).toList();
          final cosechados = state.cultivos.where((c) => c.cosechado).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Cultivos Activos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...activos.map(
                (c) => CultivoTile(
                  cultivo: c,
                  onCosechar: () async {
                    await context.read<HuertaCubit>().marcarComoCosechado(c);
                    setState(() {}); // Actualizamos estado para mostrar cambio
                  },
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'Cultivos Cosechados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...cosechados.map((c) => CultivoTile(cultivo: c)),
            ],
          );
        },
      ),
    );
  }
}

class CultivoTile extends StatelessWidget {
  final Cultivo cultivo;
  final VoidCallback? onCosechar;

  const CultivoTile({super.key, required this.cultivo, this.onCosechar});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(cultivo.id),
      title: Text(cultivo.nombre),
      subtitle: Text(
        'Sembrado: ${cultivo.fechaSiembra.toLocal().toString().split(' ')[0]}',
      ),
      trailing: cultivo.cosechado
          ? const Icon(Icons.check, color: Colors.green)
          : IconButton(
              icon: const Icon(Icons.agriculture),
              onPressed: onCosechar,
            ),
    );
  }
}
