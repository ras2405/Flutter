import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cultivo.dart';

part 'huerta_state.freezed.dart';

@freezed
class HuertaState with _$HuertaState {
  const factory HuertaState({required List<Cultivo> cultivos}) = _HuertaState;

  factory HuertaState.initial() => const HuertaState(cultivos: []);
}
