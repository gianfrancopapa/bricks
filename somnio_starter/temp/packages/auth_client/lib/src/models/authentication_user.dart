import 'package:equatable/equatable.dart';

/// {@template authentication_user}
/// Model representing a User from the authentication domain.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    required this.email,
  });

  /// An anonymous user representing the signed out state.
  static const anonymous = AuthenticationUser(
    id: '',
    email: '',
  );

  /// Authentication user id.
  final String id;

  /// Authentication user email address.
  final String email;

  @override
  List<Object?> get props => [id, email];

  /// Whether `this` is equal to [anonymous].
  bool get isAnonymous => this == anonymous;
}
