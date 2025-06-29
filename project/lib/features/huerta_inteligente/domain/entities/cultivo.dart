// class Cultivo {
//   final String nombre;
//   final DateTime fechaSiembra;
//   final bool cosechado;

//   Cultivo({
//     required this.nombre,
//     required this.fechaSiembra,
//     this.cosechado = false,
//   });
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cultivo.freezed.dart';

@freezed
class Cultivo with _$Cultivo {
  const factory Cultivo({
    required String id,
    required String nombre,
    required DateTime fechaSiembra,
    @Default(false) bool cosechado,
  }) = _Cultivo;
}
