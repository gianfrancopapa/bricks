import 'package:api_client/api_client.dart';

/// {@template user_exception}
/// Base class for all [UserResource] exceptions.
/// {@endtemplate}
abstract class UserException implements Exception {
  /// {@macro user_exception}
  const UserException(this.error, this.stackTrace);

  /// The error which was caught.
  final Object error;

  /// The error stack trace.
  final StackTrace stackTrace;
}

/// {@template sign_up_failure}
/// Thrown during the sign up and create user process if a failure occurs.
/// {@endtemplate}
class SignUpFailure extends UserException {
  /// {@macro sign_up_failure}
  const SignUpFailure(super.error, super.stackTrace);
}

/// {@template email_already_exist_failure}
/// Thrown during the sign up and create user process if a failure occurs.
/// {@endtemplate}
class EmailAlreadyExistFailure extends UserException {
  /// {@macro email_already_exist_failure}
  const EmailAlreadyExistFailure(super.error, super.stackTrace);
}

/// {@template email_verification_failure}
/// Thrown during the email verification process if a failure occurs.
/// {@endtemplate}
class EmailVerificationFailure extends UserException {
  /// {@macro email_verification_failure}
  const EmailVerificationFailure(super.error, super.stackTrace);
}

/// {@template forgot_password_failure}
/// Thrown during the forgot password process if a failure occurs.
/// {@endtemplate}
class ForgotPasswordFailure extends UserException {
  /// {@macro forgot_password_failure}
  const ForgotPasswordFailure(super.error, super.stackTrace);
}

/// {@template update_password_failure}
/// Thrown during the update password process if a failure occurs.
/// {@endtemplate}
class UpdatePasswordFailure extends UserException {
  /// {@macro update_password_failure}
  const UpdatePasswordFailure(super.error, super.stackTrace);
}

/// {@template send_otp_code_failure}
/// Thrown during the send otp code process if a failure occurs.
/// {@endtemplate}
class SendOtpCodeFailure extends UserException {
  /// {@macro send_otp_code_failure}
  const SendOtpCodeFailure(super.error, super.stackTrace);
}

/// {@template get_authenticated_user_failure}
/// Thrown during the get authenticated user process if a failure occurs.
/// {@endtemplate}
class GetAuthenticatedUserFailure extends UserException {
  /// {@macro get_authenticated_user_failure}
  const GetAuthenticatedUserFailure(super.error, super.stackTrace);
}
