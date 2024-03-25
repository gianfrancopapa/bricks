import 'dart:async';

import 'package:auth_client/auth_client.dart';
import 'package:rxdart/subjects.dart';
import 'package:token_provider/token_provider.dart';

/// {@template auth_client}
/// An authentication client implementation baked with [Auth Service]
/// {@endtemplate}
class AuthenticationClient implements TokenProvider {
  /// {@macro auth_client}
  AuthenticationClient()
      : _authEventSubject = BehaviorSubject<AuthenticationEvent>() {
    _authEventSubject.add(
      const AuthenticationEvent(
        type: AuthEventType.signedOut,
      ),
    );
  }

  final BehaviorSubject<AuthenticationEvent> _authEventSubject;

  Future<void> _mockLogin(String email) async {
    try {
      const userId = 'userId';
      _authEventSubject.add(
        AuthenticationEvent(
          type: AuthEventType.signedIn,
          user: AuthenticationUser(
            id: userId,
            email: email,
          ),
        ),
      );
    } catch (error) {
      _authEventSubject.add(
        const AuthenticationEvent(
          type: AuthEventType.signedOut,
        ),
      );
    }
  }

  /// Emits a new event when the [AuthEventType] status changes.
  Stream<AuthenticationEvent> get onAuthStatusChanged {
    return _authEventSubject.stream;
  }

  /// Initiates the sign in process with [email] and [password].
  ///
  /// If an error occurs, it throws one of the following [Exception]s:
  /// - [InvalidUserFailure] in case the user wasn't found
  /// - [SignInFailure] in case of an unknown error
  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _mockLogin(email);
  }

  @override
  Future<String?> fetchToken() async {
    return 'token';
  }

  @override
  Future<void> requestTokenRefresh() {
    throw UnimplementedError();
  }

  /// Signs out the current user.
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
