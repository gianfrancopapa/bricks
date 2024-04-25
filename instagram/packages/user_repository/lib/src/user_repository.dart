import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:auth_client/auth_client.dart';
import 'package:user_repository/user_repository.dart';

/// {@template user_repository}
/// A repository to handle all User related logic.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    required AuthenticationClient authenticationClient,
    required ApiClient apiClient,
  })  : _apiClient = apiClient,
        _authenticationClient = authenticationClient;

  final ApiClient _apiClient;
  final AuthenticationClient _authenticationClient;

  /// Maps the [AuthenticationEvent] to a [User] object.
  Future<User?> onAuthStatusChanged(AuthenticationEvent event) async {
    if (!event.type.isSignedIn) {
      return null;
    } else {
      final authUser = event.user;

      final user = User(
        id: authUser.id,
        email: authUser.email,
      );

      return user;
    }
  }

  /// Emits a new value when the authentication status changes.
  ///
  /// If the authentication status transitions from unauthenticated to
  /// authenticated, the [Stream] emits a valid [User] object.
  ///
  /// If the transition is from authenticated to unauthenticated, the [Stream]
  /// emits null.
  Stream<User?> get user {
    return _authenticationClient.onAuthStatusChanged.asyncMap(
      onAuthStatusChanged,
    );
  }

  /// Attempts to sign up the user with [email], [password] and [name].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    assert(
      password.isNotEmpty,
      () => throw ArgumentError('Password must not be empty'),
    );
    assert(
      name.isNotEmpty,
      () => throw ArgumentError('Name must not be empty'),
    );
    try {
      return _apiClient.userResource.signUp(
        SignUpRequest(
          email: email,
          password: password,
          name: name,
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  /// Attempts to verify email with [email] and [code].
  ///
  /// Throws a [EmailVerificationFailure] if an exception occurs.
  Future<void> verifyEmail({
    required String email,
    required String code,
  }) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    assert(
      code.isNotEmpty,
      () => throw ArgumentError('Code must not be empty'),
    );
    try {
      return _apiClient.userResource.verifyEmail(
        EmailVerificationRequest(
          email: email,
          code: code,
        ),
      );
    } on EmailVerificationFailure catch (error, stackTrace) {
      throw EmailVerificationFailure(error, stackTrace);
    } on Exception catch (error, stackTrace) {
      throw EmailVerificationFailure(error, stackTrace);
    }
  }

  /// Attempts to recover password for user with [email].
  ///
  /// Throws a [ForgotPasswordFailure] if an exception occurs.
  Future<void> forgotPassword({required String email}) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    try {
      return _apiClient.userResource.forgotPassword(email);
    } on Exception catch (error, stackTrace) {
      throw ForgotPasswordFailure(error, stackTrace);
    }
  }

  /// Attempts to update password with given [email], [password] and [code].
  ///
  /// Throws a [UpdatePasswordFailure] if an exception occurs.
  Future<void> updatePassword({
    required String email,
    required String password,
    required String code,
  }) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    assert(
      password.isNotEmpty,
      () => throw ArgumentError('Password must not be empty'),
    );
    assert(
      code.isNotEmpty,
      () => throw ArgumentError('Code must not be empty'),
    );
    try {
      return _apiClient.userResource.updatePassword(
        UpdatePasswordRequest(
          email: email,
          password: password,
          confirmationCode: code,
        ),
      );
    } on Exception catch (error, stackTrace) {
      throw UpdatePasswordFailure(error, stackTrace);
    }
  }

  /// Attempts to resend verification code for user with [email].
  ///
  /// Throws a [SendOtpCodeFailure] if an exception occurs.
  Future<void> sendOtpCode({required String email}) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    try {
      return _apiClient.userResource.sendOtpCode(email);
    } on SendOtpCodeFailure catch (error, stackTrace) {
      throw SendOtpCodeFailure(error, stackTrace);
    } on Exception catch (error, stackTrace) {
      throw SendOtpCodeFailure(error, stackTrace);
    }
  }

  /// Attempts to sign the user identified by [email] into the MessageDesk
  /// app by using the [password].
  ///
  /// Throws a [SignInFailure] if an exception occurs.
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    assert(
      email.isNotEmpty,
      () => throw ArgumentError('Email must not be empty'),
    );
    assert(
      password.isNotEmpty,
      () => throw ArgumentError('Password must not be empty'),
    );
    try {
      return _authenticationClient.signInUser(
        email: email,
        password: password,
      );
    } on InvalidUserFailure catch (error, stackTrace) {
      throw InvalidUserFailure(error, stackTrace);
    } on Exception catch (error, stackTrace) {
      throw SignInFailure(error, stackTrace);
    }
  }

  /// Signs out the current user.
  ///
  /// Throws a [SignOutFailure] if an exception occurs.
  Future<void> signOut() async {
    try {
      await _authenticationClient.signOut();
    } catch (error, stackTrace) {
      throw SignOutFailure(error, stackTrace);
    }
  }

  /// Deletes the current user
  ///
  /// Throws a [DeleteAccountFailure] if an exception occurs.
  Future<void> deleteAccount() async {
    try {
      await _authenticationClient.deleteAccount();
    } catch (error, stackTrace) {
      throw UserDeleteAccountFailure(error, stackTrace);
    }
  }

  /// Re-authenticates the current user
  ///
  /// Throws a [UserReAuthenticateFailure] if an exception occurs.
  Future<void> reAuthenticate({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationClient.reAuthenticate(
        email: email,
        password: password,
      );
    } catch (error, stackTrace) {
      throw UserReAuthenticateFailure(error, stackTrace);
    }
  }
}
