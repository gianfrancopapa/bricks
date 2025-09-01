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
      : authEventSubject = BehaviorSubject<AuthenticationEvent>() {
    _initialize();
  }

  /// A [BehaviorSubject] that emits [AuthenticationEvent]s.
  final BehaviorSubject<AuthenticationEvent> authEventSubject;

  Future<void> _initialize() async {
    authEventSubject.add(
      const AuthenticationEvent(
        type: AuthEventType.signedOut,
      ),
    );
  }

  /// Emits a new event when the [AuthEventType] status changes.
  Stream<AuthenticationEvent> get onAuthStatusChanged {
    return authEventSubject.stream;
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
    try {
      const userId = 'userId';
      authEventSubject.add(
        AuthenticationEvent(
          type: AuthEventType.signedIn,
          user: AuthenticationUser(
            id: userId,
            email: email,
          ),
        ),
      );
    } catch (error) {
      authEventSubject.add(
        const AuthenticationEvent(
          type: AuthEventType.signedOut,
        ),
      );
    }
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
  Future<void> signOut() async {
    authEventSubject.add(
      const AuthenticationEvent(
        type: AuthEventType.signedOut,
      ),
    );
  }

  /// Re-authenticates the current user.
  Future<void> reAuthenticate({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  /// Deletes the current user.
  Future<void> deleteAccount() async {
    authEventSubject.add(
      const AuthenticationEvent(
        type: AuthEventType.userDeleted,
      ),
    );
  }
}
