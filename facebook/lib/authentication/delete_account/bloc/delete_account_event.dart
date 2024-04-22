part of 'delete_account_bloc.dart';

class DeleteAccountEvent extends Equatable {
  const DeleteAccountEvent();

  @override
  List<Object> get props => [];
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

class DeleteAccountReseted extends DeleteAccountEvent {
  const DeleteAccountReseted();
}
