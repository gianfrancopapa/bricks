import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_request.g.dart';

/// {@template email_verification_request}
/// The request object for email verification.
/// {@endtemplate}
@JsonSerializable()
class EmailVerificationRequest extends Equatable {
  /// {@macro email_verification_request}
  const EmailVerificationRequest({
    required this.email,
    required this.code,
  });

  /// {@macro user}
  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$EmailVerificationRequestFromJson(json);
  }

  /// The user's email.
  final String email;

  /// The otp code received by email.
  final String code;

  @override
  List<Object> get props => [email, code];

  /// Converts the request to a JSON object.
  Map<String, dynamic> toJson() {
    return _$EmailVerificationRequestToJson(this);
  }
}
