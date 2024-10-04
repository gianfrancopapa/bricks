part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus {
  initial,
  loading,
  loaded,
  error,
  success;

  bool get isInitial => this == ForgotPasswordStatus.initial;
  bool get isLoading => this == ForgotPasswordStatus.loading;
  bool get isLoaded => this == ForgotPasswordStatus.loaded;
  bool get isSuccess => this == ForgotPasswordStatus.success;
  bool get isError => this == ForgotPasswordStatus.error;
}

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    required this.status,
    required this.email,
  });

  const ForgotPasswordState.initial()
      : this(
          status: ForgotPasswordStatus.initial,
          email: const Email.pure(),
        );

  final ForgotPasswordStatus status;
  final Email email;

  bool get valid => Formz.validate([email]);

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    Email? email,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
      ];
}
