import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

/// {@template update_password_request}
/// The request object for updating a user's password.
/// {@endtemplate}
@JsonSerializable()
class UpdatePasswordRequest extends Equatable {
  /// {@macro update_password_request}
  const UpdatePasswordRequest({
    required this.email,
    required this.password,
    required this.confirmationCode,
  });

  /// {@macro user}
  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordRequestFromJson(json);
  }

  /// The user's email.
  final String email;

  /// The user's password.
  final String password;

  /// The confirmation code.
  final String confirmationCode;

  @override
  List<Object> get props => [email, password, confirmationCode];

  /// Converts the request to a JSON object.
  Map<String, dynamic> toJson() {
    return _$UpdatePasswordRequestToJson(this);
  }
}
