part of 'cultivo_form_bloc.dart';

@freezed
sealed class CultivoFormEvent with _$CultivoFormEvent {
  const factory CultivoFormEvent.submitted({
    required String nombre,
    required DateTime? fecha,
  }) = CultivoSubmitted;
}
