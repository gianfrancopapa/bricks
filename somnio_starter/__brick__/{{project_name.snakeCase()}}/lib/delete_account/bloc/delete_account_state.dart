part of 'delete_account_bloc.dart';

enum DeleteAccountStatus {
  initial,
  loading,
  success,
  reauthenticated,
  reauthFailure,
  failure;

  bool get isLoading => this == DeleteAccountStatus.loading;
  bool get isSuccess => this == DeleteAccountStatus.success;
  bool get isFailure => this == DeleteAccountStatus.failure;
  bool get isReauthenticated => this == DeleteAccountStatus.reauthenticated;
  bool get isReauthFailure => this == DeleteAccountStatus.reauthFailure;
}

class DeleteAccountState extends Equatable {
  const DeleteAccountState({
    this.status = DeleteAccountStatus.initial,
    this.email = '',
    this.password = '',
  });

  final DeleteAccountStatus status;
  final String email;
  final String password;

  DeleteAccountState copyWith({
    DeleteAccountStatus? status,
    String? email,
    String? password,
  }) {
    return DeleteAccountState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
      ];
}
