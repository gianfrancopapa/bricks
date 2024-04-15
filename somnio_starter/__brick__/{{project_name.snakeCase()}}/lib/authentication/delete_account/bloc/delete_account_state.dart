part of 'delete_account_bloc.dart';

enum DeleteAccountStatus {
  initial,
  loading,
  success,
  reauthenticated,
  reauthFailure,
  deleteAccountFailure,
  failure;

  bool get isLoading => this == DeleteAccountStatus.loading;
  bool get isSuccess => this == DeleteAccountStatus.success;
  bool get isFailure => this == DeleteAccountStatus.failure;
  bool get isReauthenticated => this == DeleteAccountStatus.reauthenticated;
  bool get isDeleteAccountFailure => this == DeleteAccountStatus.deleteAccountFailure;
  bool get isReauthFailure => this == DeleteAccountStatus.reauthFailure;
}

class DeleteAccountState extends Equatable {
  const DeleteAccountState({
    required this.status,
    required this.email,
    required this.password,
  });

  const DeleteAccountState.initial() : this(
    status: DeleteAccountStatus.initial,
    email: const Email.pure(),
    password: const Password.pure(),
  );
  
  final DeleteAccountStatus status;
  final Email email;
  final Password password;

  DeleteAccountState copyWith({
    DeleteAccountStatus? status,
    Email? email,
    Password? password,
  }) {
    return DeleteAccountState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  bool get valid => Formz.validate([email, password]);

  @override
  List<Object> get props => [
        status,
        email,
        password,
      ];
}
