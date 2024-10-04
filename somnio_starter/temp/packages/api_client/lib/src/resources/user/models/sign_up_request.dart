import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

/// {@template sign_up_request}
/// The request object for signing up a new user.
/// {@endtemplate}
@JsonSerializable()
class SignUpRequest extends Equatable {
  /// {@macro sign_up_request}
  const SignUpRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  /// {@macro user}
  factory SignUpRequest.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestFromJson(json);
  }

  /// The user's email.
  final String email;

  /// The user's password.
  final String password;

  /// The user's name.
  final String name;

  @override
  List<Object> get props => [email, password, name];

  /// Converts the request to a JSON object.
  Map<String, dynamic> toJson() {
    return _$SignUpRequestToJson(this);
  }
}
