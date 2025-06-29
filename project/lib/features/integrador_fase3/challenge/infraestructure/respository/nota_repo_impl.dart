import 'package:injectable/injectable.dart';
import '../../domain/entities/nota.dart';
import '../../domain/repositories/nota_repo.dart';

@LazySingleton(as: NotaRepository)
class NotaRepositoryImpl implements NotaRepository {
  final List<Nota> _notas = [];

  @override
  void agregarNota(Nota nota) => _notas.add(nota);

  @override
  List<Nota> obtenerNotas() => List.unmodifiable(_notas);
}
