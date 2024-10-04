part of 'delete_account_bloc.dart';

abstract class DeleteAccountEvent extends Equatable {
  const DeleteAccountEvent();
}

class DeleteAccountRequested extends DeleteAccountEvent {
  const DeleteAccountRequested();

  @override
  List<Object> get props => [];
}

class DeleteAccountSubmitted extends DeleteAccountEvent {
  const DeleteAccountSubmitted();

  @override
  List<Object> get props => [];
}

class DeleteAccountEmailChanged extends DeleteAccountEvent {
  const DeleteAccountEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class DeleteAccountPasswordChanged extends DeleteAccountEvent {
  const DeleteAccountPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class DeleteAccountResetted extends DeleteAccountEvent {
  const DeleteAccountResetted();

  @override
  List<Object?> get props => [];
}
