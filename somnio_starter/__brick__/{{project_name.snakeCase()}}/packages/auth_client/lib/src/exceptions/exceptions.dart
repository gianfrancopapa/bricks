import 'package:auth_client/auth_client.dart';

/// {@template authentication_client_exception}
/// Base class for all [AuthenticationClient] exceptions.
/// {@endtemplate}
abstract class AuthenticationClientException implements Exception {
  /// {@macro authentication_client_exception}
  const AuthenticationClientException(
    this.error,
    this.stackTrace,
  );

  /// The error which was caught.
  final Object error;

  /// The error stack trace.
  final StackTrace stackTrace;
}

/// {@template sign_in_failure}
/// Thrown when an error occurs on the sign in process.
/// {@endtemplate}
class SignInFailure extends AuthenticationClientException {
  /// {@macro sign_in_failure}
  const SignInFailure(
    super.error,
    super.stackTrace,
  );
}

/// {@template invalid_user_failure}
/// Thrown when an error occurs on the sign in process because the user
/// was not found.
/// {@endtemplate}
class InvalidUserFailure extends AuthenticationClientException {
  /// {@macro invalid_user_failure}
  const InvalidUserFailure(
    super.error,
    super.stackTrace,
  );
}
