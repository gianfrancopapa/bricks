import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:form_inputs/form_inputs.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const SignUpState.initial()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmationPasswordChanged>(_onConfirmationPasswordChanged);
    on<SignUpPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<SignUpWithEmailAndPasswordRequested>(
      _onSignUpWithEmailAndPasswordRequested,
    );
    on<SignUpNameChanged>(_onNameChanged);
  }

  final UserRepository _userRepository;

  FutureOr<void> _onSignUpWithEmailAndPasswordRequested(
    SignUpWithEmailAndPasswordRequested event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await _userRepository.signUp(
        email: state.email.value,
        password: state.password.value,
        name: state.name.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  FutureOr<void> _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: Email.dirty(event.email)));
  }

  FutureOr<void> _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: Password.dirty(event.password)));
  }

  FutureOr<void> _onPasswordVisibilityChanged(
    SignUpPasswordVisibilityChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(obscurePasswords: event.obscure));
  }

  FutureOr<void> _onConfirmationPasswordChanged(
    SignUpConfirmationPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(confirmationPassword: event.password));
  }

  FutureOr<void> _onNameChanged(
    SignUpNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(name: Name.dirty(event.name)));
  }
}
