import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart';

/// {@template user_resource}
/// A client for the user resource.
/// {@endtemplate}
class UserResource {
  /// {@macro user_resource}
  UserResource({required HttpApiClient client}) : _client = client;

  final HttpApiClient _client;

  /// Attempts to sign up a new user with the provided [request].
  /// Throws a [SignUpFailure] if an error occurs.
  Future<void> signUp(SignUpRequest request) async {
    try {
      final response = Response('', 201);
      if (response.statusCode == 201) {
        return;
      } else if (response.statusCode == 409) {
        throw EmailAlreadyExistFailure(
          'Failed to sign up user: ${response.statusCode} ${response.body}',
          StackTrace.current,
        );
      } else {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final message = body['message'] as String;
        throw SignUpFailure(
          'Failed to sign up user: $message [${response.statusCode}]',
          StackTrace.current,
        );
      }
    } on Exception {
      rethrow;
    }
  }

  /// Attempts to verify an email with the provided [request].
  ///
  /// Throws a [EmailVerificationFailure] if an error occurs.
  Future<void> verifyEmail(EmailVerificationRequest request) async {
    try {
      final response = await _client.post(
        '/auth/verification',
        body: request.toJson(),
      );
      if (response.statusCode != 201) {
        throw EmailVerificationFailure(
          Exception(
            'Failed to verify email: ${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw EmailVerificationFailure(error, stackTrace);
    }
  }

  /// Attempts to recover the password for the provided [email].
  ///
  /// Throws a [ForgotPasswordFailure] if an error occurs.
  Future<void> forgotPassword(String email) async {
    try {
      final response = await _client.post(
        '/auth/password-recovery',
        body: {'email': email},
      );
      if (response.statusCode != 201) {
        throw ForgotPasswordFailure(
          Exception(
            'Failed to recover password of email: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw ForgotPasswordFailure(error, stackTrace);
    }
  }

  /// Attempts to update the password with the provided [request].
  ///
  /// Throws a [UpdatePasswordFailure] if an error occurs.
  Future<void> updatePassword(UpdatePasswordRequest request) async {
    try {
      final response = await _client.post(
        '/auth/password-confirmation',
        body: request.toJson(),
      );
      if (response.statusCode != 201) {
        throw UpdatePasswordFailure(
          Exception(
            'Failed to update password: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw UpdatePasswordFailure(error, stackTrace);
    }
  }

  /// Attempts to resend verification for the provided [email].
  ///
  /// Throws a [SendOtpCodeFailure] if an error occurs.
  Future<void> sendOtpCode(String email) async {
    try {
      final response = await _client.post(
        '/auth/resend-verification',
        body: {'email': email},
      );
      if (response.statusCode != 201) {
        throw SendOtpCodeFailure(
          Exception(
            'Failed to resend verification: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw SendOtpCodeFailure(error, stackTrace);
    }
  }

  /// Attempts return the authenticated user.
  ///
  /// Throws a [GetAuthenticatedUserFailure] if an error occurs.
  Future<UserData> getAuthenticatedUser() async {
    try {
      final response = await _client.authenticatedGet('/user');
      if (response.statusCode == 200) {
        final userString = jsonDecode(response.body);
        return UserData.fromJson(Map<String, dynamic>.from(userString as Map));
      } else {
        throw GetAuthenticatedUserFailure(
          Exception(
            'Failed to get user: '
            '${response.statusCode} ${response.body}',
          ),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      throw GetAuthenticatedUserFailure(error, stackTrace);
    }
  }
}
