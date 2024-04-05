part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class SignUpConfirmationPasswordChanged extends SignUpEvent {
  const SignUpConfirmationPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class SignUpWithEmailAndPasswordRequested extends SignUpEvent {
  const SignUpWithEmailAndPasswordRequested();

  @override
  List<Object?> get props => [];
}

class SignUpPasswordVisibilityChanged extends SignUpEvent {
  const SignUpPasswordVisibilityChanged({required this.obscure});

  final bool obscure;

  @override
  List<Object?> get props => [obscure];
}

class SignUpNameChanged extends SignUpEvent {
  const SignUpNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
