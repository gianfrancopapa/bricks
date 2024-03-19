import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:form_inputs/form_inputs.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initial()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmationPasswordChanged>(_onConfirmationPasswordChanged);
    on<SignUpPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<SignUpWithEmailAndPasswordRequested>(
      _onSignUpWithEmailAndPasswordRequested,
    );
  }

  bool get valid =>
      Formz.validate([state.email, state.password]) &&
      state.password.value == state.confirmationPassword;

  bool get emailIsValid {
    final email = state.email;
    return email.isPure || email.isValid;
  }

  bool get passwordIsValid {
    final password = state.password;
    return password.isPure || password.isValid;
  }

  bool get passwordsMatch {
    final password = state.password;
    return password.isPure || password.value == state.confirmationPassword;
  }

  bool get obscurePassowrds => state.obscurePasswords;

  FutureOr<void> _onSignUpWithEmailAndPasswordRequested(
    SignUpWithEmailAndPasswordRequested event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
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
}
