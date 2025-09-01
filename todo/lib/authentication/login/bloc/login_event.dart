part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginWithEmailAndPasswordRequested extends LoginEvent {
  const LoginWithEmailAndPasswordRequested();

  @override
  List<Object?> get props => [];
}

class LoginPasswordVisibilityChanged extends LoginEvent {
  const LoginPasswordVisibilityChanged({required this.obscure});

  final bool obscure;

  @override
  List<Object?> get props => [obscure];
}
