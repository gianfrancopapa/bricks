part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    required this.obscurePassword,
  });

  const LoginState.initial()
      : this(
          email: const Email.pure(),
          password: const Password.pure(),
          status: FormzSubmissionStatus.initial,
          obscurePassword: true,
        );

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool obscurePassword;

  @override
  List<Object?> get props => [email, password, status, obscurePassword];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? obscurePassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}
