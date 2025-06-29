import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubit/notas_cubit.dart';
import '../../application/cubit/notas_state.dart';

class NotasPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  NotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notas Rápidas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: _controller),
          ),
          ElevatedButton(
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty) {
                context.read<NotasCubit>().agregarNota(text);
                _controller.clear();
              }
            },
            child: Text('Agregar Nota'),
          ),
          Expanded(
            child: BlocBuilder<NotasCubit, NotasState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.notas.length,
                  itemBuilder: (_, i) =>
                      ListTile(title: Text(state.notas[i].contenido)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
