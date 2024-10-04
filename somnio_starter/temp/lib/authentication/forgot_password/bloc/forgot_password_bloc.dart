import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordSubmitted>(_onSubmitted);
  }
  final UserRepository _userRepository;

  FutureOr<void> _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(state.copyWith(email: Email.dirty(event.email)));
  }

  FutureOr<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ForgotPasswordStatus.loading));
      await _userRepository.forgotPassword(email: state.email.value);
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } on Exception {
      emit(state.copyWith(status: ForgotPasswordStatus.error));
    }
  }
}
