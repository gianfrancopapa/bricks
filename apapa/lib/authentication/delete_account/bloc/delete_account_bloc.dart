import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const DeleteAccountState()) {
    on<DeleteAccountRequested>(_onDeleteAccountRequested);
    on<DeleteAccountEmailChanged>(_onEmailChanged);
    on<DeleteAccountPasswordChanged>(_onPasswordChanged);
    on<DeleteAccountSubmitted>(_onDeleteAccountSubmitted);
    on<DeleteAccountReseted>(
      (event, emit) {
        emit(state.copyWith(status: DeleteAccountStatus.initial));
      },
    );
  }

  // ignore: unused_field
  final UserRepository _userRepository;

  FutureOr<void> _onDeleteAccountRequested(
    DeleteAccountRequested event,
    Emitter<DeleteAccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: DeleteAccountStatus.loading));
      await _userRepository.deleteAccount();
      emit(state.copyWith(status: DeleteAccountStatus.reauthenticated));
    } on UserReAuthenticateFailure {
      emit(
        state.copyWith(
          status: DeleteAccountStatus.reauthFailure,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: DeleteAccountStatus.failure,
        ),
      );
    }
  }
    FutureOr<void> _onEmailChanged(
      DeleteAccountEmailChanged event,
      Emitter<DeleteAccountState> emit,
    ) {
      emit(state.copyWith(email: Email.dirty(event.email)));
    }

    FutureOr<void> _onPasswordChanged(
      DeleteAccountPasswordChanged event,
      Emitter<DeleteAccountState> emit,
    ) {
      emit(state.copyWith(password: Password.dirty(event.password)));
    }

    FutureOr<void> _onDeleteAccountSubmitted(
      DeleteAccountSubmitted event,
      Emitter<DeleteAccountState> emit,
    ) async {
      try {
        emit(state.copyWith(status: DeleteAccountStatus.loading));
        await _userRepository.deleteAccount();
        emit(state.copyWith(status: DeleteAccountStatus.success));
      } on UserDeleteAccountFailure {
        emit(state.copyWith(status: DeleteAccountStatus.deleteAccountFailure));
      } on Exception {
        emit(state.copyWith(status: DeleteAccountStatus.failure));
      }
    }
  
}
