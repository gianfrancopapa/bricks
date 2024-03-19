part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.status,
    required this.email,
    required this.password,
    required this.confirmationPassword,
    required this.obscurePasswords,
  });

  const SignUpState.initial()
      : this(
          status: FormzSubmissionStatus.initial,
          email: const Email.pure(),
          password: const Password.pure(),
          confirmationPassword: '',
          obscurePasswords: true,
        );

  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final String confirmationPassword;
  final bool obscurePasswords;

  SignUpState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Password? password,
    String? confirmationPassword,
    bool? obscurePasswords,
  }) {
    return SignUpState(
      status: status ?? this.status,
      confirmationPassword: confirmationPassword ?? this.confirmationPassword,
      email: email ?? this.email,
      obscurePasswords: obscurePasswords ?? this.obscurePasswords,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        confirmationPassword,
        obscurePasswords,
      ];
}
