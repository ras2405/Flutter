import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

// Events
class NameChangedEvent {
  final String name;

  NameChangedEvent(this.name);
}

class EmailChangedEvent {
  final String email;

  EmailChangedEvent(this.email);
}

class MessageChangedEvent {
  final String message;

  MessageChangedEvent(this.message);
}

class FormSubmittedEvent {
  final String name;
  final String email;
  final String message;

  FormSubmittedEvent({
    required this.name,
    required this.email,
    required this.message,
  });
}

// States (sealed classes)
sealed class FormState with _$FormState {
  const factory FormState.initial() = _Initial;
  const factory FormState.loading() = _Loading;
  const factory FormState.success() = _Success;
  const factory FormState.failure(String error) = _Failure;
  const factory FormState.error(String message) = _Error;
}

// Bloc
final class FormBloc extends Bloc<dynamic, FormState> {
  FormBloc() : super(const FormState.initial()) {
    on<NameChangedEvent>((event, emit) {
      if (event.name.characters.length < 3) {
        emit(const FormState.error('Name cannot be shorter than 3 characters'));
      } else {
        emit(const FormState.initial());
      }
    });

    on<EmailChangedEvent>((event, emit) {
      if (!event.email.contains('@') || // que contenga '@' y '.'
          !event.email.contains('.')) {
        emit(
          const FormState.error(
            'Invalid email address, must contain "@" and "."',
          ),
        );
      } else {
        emit(const FormState.initial());
      }
    });

    on<MessageChangedEvent>((event, emit) {
      // agregar message validation
    });

    on<FormSubmittedEvent>((event, emit) async {
      emit(const FormState.loading());
      try {
        // form submission
        await Future.delayed(const Duration(seconds: 2));
        emit(const FormState.success());
      } catch (e) {
        emit(FormState.failure(e.toString()));
      }
    });
  }
}
