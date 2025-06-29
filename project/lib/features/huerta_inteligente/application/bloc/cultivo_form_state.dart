part of 'cultivo_form_bloc.dart';

@freezed
sealed class CultivoFormState with _$CultivoFormState {
  const factory CultivoFormState.initial() = _Initial;
  const factory CultivoFormState.validating() = _Validating;
  const factory CultivoFormState.submitting() = _Submitting;
  const factory CultivoFormState.success() = _Success;
  const factory CultivoFormState.error(String message) = _Error;
}
