import 'package:user_repository/user_repository.dart';

/// {@template user_repository_exception}
/// Base class for all [UserRepository] exceptions.
/// {@endtemplate}
abstract class UserRepositoryException implements Exception {
  /// {@macro user_repository_exception}
  const UserRepositoryException(this.error, this.stackTrace);

  /// The error which was caught.
  final Object error;

  /// The error stack trace.
  final StackTrace stackTrace;
}

/// {@template sign_out_failure}
/// Thrown during the sign out process if a failure occurs.
/// {@endtemplate}
class SignOutFailure extends UserRepositoryException {
  /// {@macro sign_out_failure}
  const SignOutFailure(super.error, super.stackTrace);
}
