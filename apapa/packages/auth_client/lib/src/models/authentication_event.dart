import 'package:auth_client/auth_client.dart';
import 'package:equatable/equatable.dart';

/// {@template auth_event_type}
/// Model representing the different event types regarding the authentication
/// status.
/// {@endtemplate}
enum AuthEventType {
  /// Signed in event.
  signedIn,

  /// Signed out event.
  signedOut,

  /// Session expired event.
  sessionExpired,

  /// User deleted event.
  userDeleted;

  /// Whether `this` is equal to [signedIn].
  bool get isSignedIn => this == signedIn;

  /// Whether `this` is equal to [signedOut].
  bool get isSignedOut => this == signedOut;

  /// Whether `this` is equal to [sessionExpired].
  bool get isSessionExpired => this == sessionExpired;

  /// Whether `this` is equal to [userDeleted].
  bool get isUserDeleted => this == userDeleted;
}

/// {@template authentication_event}
/// Model representing an authentication event.
/// {@endtemplate}
class AuthenticationEvent extends Equatable {
  /// {@macro authentication_event}
  const AuthenticationEvent({
    required this.type,
    AuthenticationUser? user,
  }) : user = user ?? AuthenticationUser.anonymous;

  /// The authentication user.
  final AuthenticationUser user;

  /// The authentication event type.
  final AuthEventType type;

  @override
  List<Object> get props => [user, type];
}
